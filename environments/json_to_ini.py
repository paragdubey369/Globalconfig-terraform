import json
import sys

def json_to_ini(tf_output_file, ini_output_file):
    with open(tf_output_file, 'r') as f:
        data = json.load(f)

    with open(ini_output_file, 'w') as f:
        for group, content in data.items():
            f.write(f"[{group}]\n")
            for host, ip in content["value"].items():
                f.write(f"{host} ansible_host={ip}\n")
            f.write("\n")

if __name__ == "__main__":
    tf_output = sys.argv[1] if len(sys.argv) > 1 else "output.json"
    ini_output = sys.argv[2] if len(sys.argv) > 2 else "inventory.ini"
    json_to_ini(tf_output, ini_output)