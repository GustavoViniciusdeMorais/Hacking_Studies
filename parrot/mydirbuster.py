import requests

# Function to perform directory brute-forcing
# include http:// in the url input
def dirbuster(url, endpoints_file):
    with open(endpoints_file, 'r') as file:
        endpoints = file.read().splitlines()

    for endpoint in endpoints:
        full_url = url + '/' + endpoint
        response = requests.get(full_url)
        if response.status_code == 200:
            print(f"[+] Found: {full_url}")
        elif response.status_code == 404:
            print(f"[-] Not Found: {full_url}")
        else:
            print(f"[!] Error: {response.status_code} for {full_url}")

# Example usage
if __name__ == "__main__":
    target_url = input("Enter the target URL: ")
    endpoints_file = input("Enter the file containing possible endpoints and directories: ")
    dirbuster(target_url, endpoints_file)
