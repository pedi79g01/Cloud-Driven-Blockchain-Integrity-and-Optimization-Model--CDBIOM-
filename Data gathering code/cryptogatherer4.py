import requests
import csv
import datetime

# Token Classification Data
token_classification = [
    {'Contract Address': '0x1234567890abcdef...', 'Verified Contract': 'Y', 'Scam Indicator': 'N', 'Notes': 'Verified contract, no suspicious activity'},
    {'Contract Address': '0xabcdef1234567890...', 'Verified Contract': 'N', 'Scam Indicator': 'Y', 'Notes': 'Unverified contract, scam reports'},
    {'Contract Address': '0x98765abdcf7ef...', 'Verified Contract': 'Y', 'Scam Indicator': 'N', 'Notes': 'No reports, active trading'},
    {'Contract Address': '0xabcdef765fedc...', 'Verified Contract': 'N', 'Scam Indicator': 'Y', 'Notes': 'Reported rug pull, scam detected'}
]

def fetch_coingecko_data(vs_currency='usd', per_page=50, page=1):
    """
    Fetch cryptocurrency market data from CoinGecko API.
    :param vs_currency: The currency to convert prices into (e.g., 'usd').
    :param per_page: Number of results per page.
    :param page: Page number.
    :return: List of cryptocurrency market data.
    """
    print("Fetching data from CoinGecko...")
    url = "https://api.coingecko.com/api/v3/coins/markets"
    params = {
        'vs_currency': vs_currency,
        'order': 'market_cap_desc',
        'per_page': per_page,
        'page': page,
        'sparkline': 'false'  # Don't include sparkline data
    }

    response = requests.get(url, params=params)
    if response.status_code == 200:
        print("Data fetched successfully!")
        return response.json()
    else:
        print(f"Error {response.status_code}: {response.text}")
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
    fieldnames = ['Token Name', 'Token Symbol', 'Contract Address', 'Verified Contract', 'Scam Indicator',
                  'Notes', 'Current Price (USD)', 'Market Cap (USD)', '24h Volume (USD)', 
                  '% Change (1h)', '% Change (24h)', '% Change (7d)']

    with open(filename, "w", newline='', encoding="utf-8") as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for token in token_data:
            writer.writerow(token)

def main():
    # Fetch CoinGecko market data
    coingecko_data = fetch_coingecko_data(vs_currency='usd', per_page=50, page=1)

    # Process tokens and combine with classification data
    processed_tokens = []
    for token in coingecko_data:
        # Extract details from CoinGecko API response
        token_name = token.get('name', 'N/A')
        token_symbol = token.get('symbol', 'N/A')
        contract_address = token.get('platforms', {}).get('ethereum', 'N/A')  # Example: Get Ethereum contract address
        current_price = token.get('current_price', 'N/A')
        market_cap = token.get('market_cap', 'N/A')
        volume_24h = token.get('total_volume', 'N/A')
        percent_change_24h = token.get('price_change_percentage_24h', 'N/A')
        percent_change_7d = token.get('price_change_percentage_7d_in_currency', 'N/A')

        # Classify token based on contract address
        classification = classify_token(contract_address)

        # Combine data
        processed_tokens.append({
            'Token Name': token_name,
            'Token Symbol': token_symbol,
            'Contract Address': contract_address,
            'Verified Contract': classification['Verified Contract'],
            'Scam Indicator': classification['Scam Indicator'],
            'Notes': classification['Notes'],
            'Current Price (USD)': current_price,
            'Market Cap (USD)': market_cap,
            '24h Volume (USD)': volume_24h,
            '% Change (1h)': token.get('price_change_percentage_1h_in_currency', 'N/A'),
            '% Change (24h)': percent_change_24h,
            '% Change (7d)': percent_change_7d
        })

    # Save to CSV
    output_filename = f"coingecko_token_data_{datetime.date.today()}.csv"
    save_to_csv(processed_tokens, output_filename)
    print(f"Data saved to {output_filename}")

if __name__ == '__main__':
    main()
