import requests
import csv
import datetime

# API Keys for different explorers (replace with your own keys)
BSC_API_KEY = "YOUR_BSCSCAN_API_KEY"  # Binance Smart Chain
TRON_API_KEY = "YOUR_TRONSCAN_API_KEY"  # Tron API key (if applicable)
TON_API_KEY = ""  # TON public API (if available)
SOL_API_KEY = ""  # Solana (SolScan)

# Token Classification Data
token_classification = [
    {'Contract Address': '0x1234567890abcdef...', 'Verified Contract': 'Y', 'Scam Indicator': 'N', 'Notes': 'Verified, no scam reports'},
    {'Contract Address': '0xabcdef1234567890...', 'Verified Contract': 'N', 'Scam Indicator': 'Y', 'Notes': 'Unverified contract, possible scam'}
]

def fetch_bsc_tokens(address):
    """
    Fetch BEP-20 tokens for a Binance Smart Chain address using BscScan API.
    """
    print("Fetching BSC data...")
    url = "https://api.bscscan.com/api"
    params = {
        "module": "account",
        "action": "tokentx",
        "address": address,
        "startblock": 0,
        "endblock": 99999999,
        "sort": "asc",
        "apikey": BSC_API_KEY
    }
    response = requests.get(url, params=params)
    return response.json().get("result", []) if response.status_code == 200 else []

def fetch_tron_tokens(address):
    """
    Fetch TRC-20 tokens for a Tron address using TronScan API.
    """
    print("Fetching Tron data...")
    url = f"https://apilist.tronscan.org/api/token_trc20/transfers?limit=20&start=0&address={address}"
    response = requests.get(url)
    return response.json().get("token_transfers", []) if response.status_code == 200 else []

def fetch_ton_data(address):
    """
    Fetch TON blockchain transactions for an address (TONScan API placeholder).
    """
    print("Fetching TON data...")
    url = f"https://tonapi.io/v1/blockchain/getTransactions?account={address}"
    response = requests.get(url)
    return response.json().get("transactions", []) if response.status_code == 200 else []

def fetch_sol_tokens(address):
    """
    Fetch Solana SPL tokens for an address using SolScan API.
    """
    print("Fetching Solana data...")
    url = f"https://api.solscan.io/account/tokens?address={address}"
    response = requests.get(url)
    return response.json().get("data", []) if response.status_code == 200 else []

def classify_token(contract_address):
    """
    Match token classification data based on contract address.
    """
    for token in token_classification:
        if token['Contract Address'].lower() == contract_address.lower():
            return token
    return {'Verified Contract': 'N/A', 'Scam Indicator': 'N/A', 'Notes': 'Not classified'}

def save_to_csv(token_data, filename):
    """
    Save token data to a CSV file.
    """
    fieldnames = ['Blockchain', 'Token Name', 'Token Symbol', 'Contract Address', 'Verified Contract',
                  'Scam Indicator', 'Notes', 'From', 'To', 'Value', 'Timestamp']
    with open(filename, "w", newline='', encoding="utf-8") as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for token in token_data:
            writer.writerow(token)

def main():
    # Example addresses (replace with actual addresses)
    bsc_address = "YOUR_BSC_ADDRESS"
    tron_address = "YOUR_TRON_ADDRESS"
    ton_address = "YOUR_TON_ADDRESS"
    sol_address = "YOUR_SOL_ADDRESS"

    all_tokens = []

    # Fetch BSC tokens
    bsc_tokens = fetch_bsc_tokens(bsc_address)
    for token in bsc_tokens:
        classification = classify_token(token['contractAddress'])
        all_tokens.append({
            'Blockchain': 'BSC',
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

    # Fetch TRON tokens
    tron_tokens = fetch_tron_tokens(tron_address)
    for token in tron_tokens:
        all_tokens.append({
            'Blockchain': 'TRON',
            'Token Name': token.get('tokenInfo', {}).get('name', 'N/A'),
            'Token Symbol': token.get('tokenInfo', {}).get('symbol', 'N/A'),
            'Contract Address': token.get('contract_address', 'N/A'),
            'Verified Contract': 'N/A',
            'Scam Indicator': 'N/A',
            'Notes': 'No classification',
            'From': token.get('from_address', 'N/A'),
            'To': token.get('to_address', 'N/A'),
            'Value': token.get('quant', 'N/A'),
            'Timestamp': token.get('block_ts', 'N/A')
        })

    # Fetch TON tokens
    ton_data = fetch_ton_data(ton_address)
    for tx in ton_data:
        all_tokens.append({
            'Blockchain': 'TON',
            'Token Name': 'N/A',
            'Token Symbol': 'N/A',
            'Contract Address': 'N/A',
            'Verified Contract': 'N/A',
            'Scam Indicator': 'N/A',
            'Notes': 'TON transaction',
            'From': tx.get('from', 'N/A'),
            'To': tx.get('to', 'N/A'),
            'Value': tx.get('value', 'N/A'),
            'Timestamp': tx.get('utime_string', 'N/A')
        })

    # Fetch Solana tokens
    sol_tokens = fetch_sol_tokens(sol_address)
    for token in sol_tokens:
        all_tokens.append({
            'Blockchain': 'Solana',
            'Token Name': token.get('tokenName', 'N/A'),
            'Token Symbol': token.get('tokenSymbol', 'N/A'),
            'Contract Address': token.get('tokenAddress', 'N/A'),
            'Verified Contract': 'N/A',
            'Scam Indicator': 'N/A',
            'Notes': 'Solana SPL token',
            'From': 'N/A',
            'To': 'N/A',
            'Value': token.get('amount', 'N/A'),
            'Timestamp': 'N/A'
        })

    # Save combined data to CSV
    output_filename = f"blockchain_token_data_{datetime.date.today()}.csv"
    save_to_csv(all_tokens, output_filename)
    print(f"Data saved to {output_filename}")

if __name__ == '__main__':
    main()
