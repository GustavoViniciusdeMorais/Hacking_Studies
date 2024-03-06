import requests
import sys

def main():
    if len(sys.argv) != 3:
        print("Usage: python subdomain_buster.py <subdomain_file> <url>")
        return
    
    subdomain_file = sys.argv[1]
    url = sys.argv[2]
    
    try:
        with open(subdomain_file, 'r') as f:
            subdomains = f.read().splitlines()
    except FileNotFoundError:
        print("Subdomain file not found.")
        return
    print("Searching ...")
    for subdomain in subdomains:
        full_url = f"http://{subdomain}.{url}"
        try:
            response = requests.get(full_url)
            if response.status_code != 404:
                print(f"Subdomain found: {full_url}")
            else:
                print(f"Subdomain not found: {full_url}")
        except requests.ConnectionError:
            print(f"Exception was raised: {full_url}, skipping ...")
            pass

if __name__ == "__main__":
    main()
