import requests
import csv
import datetime

# Replace this with your Etherscan API key
ETHERSCAN_API_KEY = "YOUR_ETHERSCAN_API_KEY"

# Token Classification Data
token_classification = [
    {'Contract Address': '0x1234567890abcdef...', 'Verified Contract': 'Y', 'Scam Indicator': 'N', 'Notes': 'Verified contract, no suspicious activity'},
    {'Contract Address': '0xabcdef1234567890...', 'Verified Contract': 'N', 'Scam Indicator': 'Y', 'Notes': 'Unverified contract, scam reports'},
    {'Contract Address': '0x98765abdcf7ef...', 'Verified Contract': 'Y', 'Scam Indicator': 'N', 'Notes': 'No reports, active trading'},
    {'Contract Address': '0xabcdef765fedc...', 'Verified Contract': 'N', 'Scam Indicator': 'Y', 'Notes': 'Rug pull reported'}
]

def fetch_erc20_tokens(api_key, address=""):
    """
    Fetch ERC-20 token data from Etherscan API.
    :param api_key: Etherscan API key.
    :param address: Ethereum address to check tokens (optional).
    :return: List of token data.
    """
    url = f"https://api.etherscan.io/api"
    params = {
        "module": "account",
        "action": "tokentx",
        "address": address,  # Optionally filter tokens sent/received by an address
        "startblock": 0,
        "endblock": 99999999,
        "sort": "asc",
        "apikey": api_key
    }

    print("Fetching data from Etherscan...")
    response = requests.get(url, params=params)
    if response.status_code == 200:
        data = response.json()
        if data["status"] == "1":
            print("Data fetched successfully!")
            return data["result"]
        else:
            print("Error:", data["message"])
            return []
    else:
        print("HTTP Error:", response.status_code)
        return []

def classify_token(contract_address):
    """
    Match token classification data based on contract address.
    :param contract_address: The token contract address.
    :return: Classification data (dict) or default values.
    """
    for token in token_classification:
        if token['Contract Address'].lower() == contract_address.lower():
            return token
    return {'Verified Contract': 'N/A', 'Scam Indicator': 'N/A', 'Notes': 'Not classified'}

def save_to_csv(token_data, filename):
    """
    Save token data to a CSV file.
    :param token_data: List of token data dictionaries.
    :param filename: Output CSV filename.
    """
    fieldnames = ['Token Name', 'Token Symbol', 'Contract Address', 'Verified Contract',
                  'Scam Indicator', 'Notes', 'From', 'To', 'Value', 'Timestamp']

    with open(filename, "w", newline='', encoding="utf-8") as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for token in token_data:
            writer.writerow(token)

def main():
    # Ethereum address to filter token transactions (optional, can be empty)
    ethereum_address = "YOUR_ETHEREUM_ADDRESS"  # Replace with an Ethereum address or leave blank

    # Fetch ERC-20 token transactions
    tokens = fetch_erc20_tokens(ETHERSCAN_API_KEY, ethereum_address)

    # Process tokens and add classification data
    processed_tokens = []
    for token in tokens:
        classification = classify_token(token['contractAddress'])
        processed_tokens.append({
            'Token Name': token.get('tokenName', 'N/A'),
            'Token Symbol': token.get('tokenSymbol', 'N/A'),
            'Contract Address': token['contractAddress'],
            'Verified Contract': classification['Verified Contract'],
            'Scam Indicator': classification['Scam Indicator'],
            'Notes': classification['Notes'],
            'From': token.get('from', 'N/A'),
            'To': token.get('to', 'N/A'),
            'Value': token.get('value', 'N/A'),
            'Timestamp': datetime.datetime.fromtimestamp(int(token['timeStamp'])).strftime('%Y-%m-%d %H:%M:%S')
        })

    # Save data to CSV
    output_filename = f"etherscan_token_data_{datetime.date.today()}.csv"
    save_to_csv(processed_tokens, output_filename)
    print(f"Data saved to {output_filename}")

if __name__ == '__main__':
    main()
