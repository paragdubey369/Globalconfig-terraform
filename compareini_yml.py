import configparser
import yaml
import os
import sys

# Paths
terraform_ini_path = 'environments/dev_m/inventory.yml'
ansible_root_dir = 'Ansible-Deployment'
components = {
    'rke2': {
        'file': 'dev_m.yml',
        'prefixes': ['control_nodes', 'worker_nodes', 'bastion_nodes']
    },
    'haproxy': {
        'file': 'dev_m.yml',
        'prefixes': ['haproxy_primary']
    },
    'mariadb': {
        'file': 'dev_m.yml',
        'prefixes': ['galera_cluster_nocc']
    },
    # 'hauler': {
    #     'file': 'inventory.yml',
    #     'prefixes' : ['hauler']
    # }
}

def load_ini_hosts(path):
    config = configparser.ConfigParser(allow_no_value=True, delimiters=('=',))
    config.optionxform = str
    config.read(path)

    ini_hosts = {}
    for section in config.sections():
        for host, ip in config.items(section):
            ini_hosts[host.strip()] = ip.strip() if ip else None
    return ini_hosts

def load_yaml_hosts(path):
    with open(path, 'r') as f:
        data = yaml.safe_load(f)

    yaml_hosts = {}
    if not data:
        return yaml_hosts

    for section, hosts in data.items():
        if isinstance(hosts, dict):
            for host, info in hosts.items():
                if isinstance(info, dict) and 'ansible_host' in info:
                    yaml_hosts[host] = str(info['ansible_host'])
    return yaml_hosts

def compare_hosts(component, ini_hosts, yaml_hosts, prefixes):
    print(f"\n🔍 Comparing for component: \033[1;36m{component}\033[0m")

 
    filtered_ini_hosts = {
        h: ip for h, ip in ini_hosts.items()
        if any(h.startswith(prefix) for prefix in prefixes)
    }

    all_ok = True
    for host, ip in filtered_ini_hosts.items():
        if host not in yaml_hosts:
            print(f"\033[1;31m Host '{host}' missing in {component}/dev_m.yml\033[0m")
            all_ok = False
        elif yaml_hosts[host] != ip:
            print(f"\033[1;31m IP mismatch for '{host}': INI={ip}, YAML={yaml_hosts[host]}\033[0m")
            all_ok = False
        else:
            print(f"\033[1;32m✔ {host} matches ({ip})\033[0m")

    for host in yaml_hosts:
        if host not in filtered_ini_hosts:
            print(f"\033[1;33m Host '{host}' in YAML but not expected for this component\033[0m")

    return all_ok

def main():
    if not os.path.exists(terraform_ini_path):
        print(f"\033[1;31mMissing Terraform INI file: {terraform_ini_path}\033[0m")
        sys.exit(1)

    ini_hosts = load_ini_hosts(terraform_ini_path)

    all_matched = True
    for component, info in components.items():
        yaml_path = os.path.join(ansible_root_dir, component, info['file'])
        if not os.path.exists(yaml_path):
            print(f"\033[1;31mMissing YAML file: {yaml_path}\033[0m")
            all_matched = False
            continue

        yaml_hosts = load_yaml_hosts(yaml_path)
        matched = compare_hosts(component, ini_hosts, yaml_hosts, info['prefixes'])
        if not matched:
            all_matched = False

    if all_matched:
        print("\n\033[1;32m All inventory entries match!\033[0m")
        sys.exit(0)
    else:
        print("\n\033[1;31m Some mismatches found. Please review above.\033[0m")
        sys.exit(1)

if __name__ == "__main__":
    main()
