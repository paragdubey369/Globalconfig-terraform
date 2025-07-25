import json
import yaml
import sys

def json_to_yaml(tf_output_file, yaml_output_file):
    with open(tf_output_file, 'r') as f:
        data = json.load(f)

    inventory = {}

    for group, content in data.items():
        inventory[group] = {}
        for host, ip in content["value"].items():
            inventory[group][host] = {
                "ansible_host": ip
            }

    with open(yaml_output_file, 'w') as f:
        yaml.dump(inventory, f, sort_keys=False)

if __name__ == "__main__":
    tf_output = sys.argv[1] if len(sys.argv) > 1 else "output.json"
    yaml_output = sys.argv[2] if len(sys.argv) > 2 else "inventory.yml"
    json_to_yaml(tf_output, yaml_output)
