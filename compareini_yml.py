import yaml
import os
import sys

# === Paths ===
terraform_yml_path = 'environments/dev_m/inventory.yml'
ansible_root_dir = 'Ansible-Deployment'

# === Component-wise mapping ===
components = {
    'rke2': {
        'file': 'dev_m.yml',
        'prefixes': ['control', 'worker', 'bastion'],
        'name_keys': ['node_name']
    },
    'haproxy': {
        'file': 'dev_m.yml',
        'prefixes': ['haproxy'],
        'name_keys': ['primary_ha']
    },
    'mariadb': {
        'file': 'dev_m.yml',
        'prefixes': ['mariadb', 'galera'],
        'name_keys': ['wsrep_node_name']
    }
}

# === Load Terraform Output Inventory (YAML format) ===
def load_tf_inventory(path):
    with open(path, 'r') as f:
        data = yaml.safe_load(f)

    hosts = {}
    for group, entries in data.items():
        if isinstance(entries, dict):
            for hostname, conf in entries.items():
                if isinstance(conf, dict) and 'ansible_host' in conf:
                    hosts[hostname] = str(conf['ansible_host'])
    return hosts

# === Load Ansible Component Inventory ===
def load_ansible_component_hosts(path, name_keys):
    with open(path, 'r') as f:
        data = yaml.safe_load(f)

    hosts = {}
    if not data or 'all' not in data or 'children' not in data['all']:
        return hosts

    children = data['all']['children']
    for group_name, group_data in children.items():
        if not isinstance(group_data, dict):
            continue

        # Drill down if nested groups like children -> group -> hosts
        if 'children' in group_data:
            for nested_group, nested_data in group_data['children'].items():
                if 'hosts' in nested_data:
                    for ansible_name, meta in nested_data['hosts'].items():
                        if not isinstance(meta, dict):
                            continue
                        if 'ansible_host' in meta:
                            ip = str(meta['ansible_host'])
                            for key in name_keys:
                                if key in meta:
                                    logical_name = str(meta[key])
                                    hosts[logical_name] = ip
        elif 'hosts' in group_data:
            for ansible_name, meta in group_data['hosts'].items():
                if not isinstance(meta, dict):
                    continue
                if 'ansible_host' in meta:
                    ip = str(meta['ansible_host'])
                    for key in name_keys:
                        if key in meta:
                            logical_name = str(meta[key])
                            hosts[logical_name] = ip

    return hosts

# === Comparison ===
def compare_hosts(component, tf_hosts, ans_hosts, prefixes):
    print(f"\n🔍 Comparing for component: \033[1;36m{component}\033[0m")

    # Filter Terraform hosts based on expected prefixes
    tf_filtered = {
        h: ip for h, ip in tf_hosts.items()
        if any(h.startswith(prefix) for prefix in prefixes)
    }

    all_ok = True
    for host, ip in tf_filtered.items():
        if host not in ans_hosts:
            print(f"\033[1;31m❌ Host '{host}' missing in {component}/dev_m.yml\033[0m")
            all_ok = False
        elif ans_hosts[host] != ip:
            print(f"\033[1;31m❌ IP mismatch for '{host}': TF={ip}, YAML={ans_hosts[host]}\033[0m")
            all_ok = False
        else:
            print(f"\033[1;32m✔ {host} matches ({ip})\033[0m")

    for host in ans_hosts:
        if host not in tf_filtered:
            print(f"\033[1;33m⚠ Host '{host}' in YAML but not expected for this component\033[0m")

    return all_ok

# === Main ===
def main():
    if not os.path.exists(terraform_yml_path):
        print(f"\033[1;31m❌ Missing Terraform inventory YAML: {terraform_yml_path}\033[0m")
        sys.exit(1)

    tf_hosts = load_tf_inventory(terraform_yml_path)

    all_matched = True
    for component, info in components.items():
        yaml_path = os.path.join(ansible_root_dir, component, info['file'])
        if not os.path.exists(yaml_path):
            print(f"\033[1;31m❌ Missing YAML file: {yaml_path}\033[0m")
            all_matched = False
            continue

        ans_hosts = load_ansible_component_hosts(yaml_path, info['name_keys'])
        matched = compare_hosts(component, tf_hosts, ans_hosts, info['prefixes'])
        if not matched:
            all_matched = False

    if all_matched:
        print("\n\033[1;32m✅ All inventory entries match!\033[0m")
        sys.exit(0)
    else:
        print("\n\033[1;31m❌ Some mismatches found. Please review above.\033[0m")
        sys.exit(1)

if __name__ == "__main__":
    main()
