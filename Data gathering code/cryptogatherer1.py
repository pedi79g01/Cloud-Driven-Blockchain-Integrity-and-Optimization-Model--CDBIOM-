import requests
from bs4 import BeautifulSoup
import csv
import datetime

# Token Classification Data (can be extended or modified)
token_classification = {
    'Ethereum': [
        {'Token Name': 'TokenA', 'Token Symbol': 'TKA', 'Contract Address': '0x1234567890abcdef...', 'Verified Contract': 'Y', 'Scam Indicator': 'N', 'Notes': 'Verified contract, no suspicious activity'},
        {'Token Name': 'TokenB', 'Token Symbol': 'TKD', 'Contract Address': '0xabcdef1234567890...', 'Verified Contract': 'N', 'Scam Indicator': 'Y', 'Notes': 'Contract not verified, reports of scam'}
    ],
    'Solana': [
        {'Token Name': 'TokenC', 'Token Symbol': 'TSC', 'Contract Address': '3vGVxY7J7pRZXoX...', 'Verified Contract': 'Y', 'Scam Indicator': 'N', 'Notes': 'Small community, some large wallet activity'},
        {'Token Name': 'TokenD', 'Token Symbol': 'TSD', 'Contract Address': '2sGh97kpV4qD6hx...', 'Verified Contract': 'N', 'Scam Indicator': 'Y', 'Notes': 'Suspicious token minting patterns'}
    ],
    # Add more networks and tokens here...
    'TON': [
        {'Token Name': 'TokenE', 'Token Symbol': 'TNE', 'Contract Address': '0x98765abdcf7ef...', 'Verified Contract': 'Y', 'Scam Indicator': 'N', 'Notes': 'No reports, active trading'},
        {'Token Name': 'TokenF', 'Token Symbol': 'TNF', 'Contract Address': '0xabcdef765fedc...', 'Verified Contract': 'N', 'Scam Indicator': 'Y', 'Notes': 'Reported rug pull, scam detected'}
    ]
    # Add more networks here...
}

def extract(url):
    """
    Export all crypto data from CoinMarketCap along with token classification.
    Arguments:
         url (str): URL of the CoinMarketCap page.
    Returns:
        Creates a CSV file with cryptocurrency data and classification.
    """
    session = requests.session()
    start = datetime.datetime.now()

    for retry in range(10):
        response = session.get(url)
        print(f"Status Code: {response.status_code}")
        if response.status_code == 200:
            soup = BeautifulSoup(response.text, 'html.parser')
            rows = soup.find_all('tr', {'id': lambda x: x and x.startswith('id-')})

            # CSV Output Path
            output_path = f"./cryptocurrencies_with_classification_{str(datetime.date.today())}.csv"
            with open(output_path, "w", newline='', encoding="utf-8") as f:
                fieldnames = ['Blockchain Network', 'Token Name', 'Token Symbol', 'Contract Address', 'Verified Contract', 
                              'Scam Indicator', 'Notes', 'Price', 'Market Cap', 'Circulating Supply', 'Volume (24h)', 
                              '% Change (1h)', '% Change (24h)', '% Change (7d)']
                writer = csv.DictWriter(f, fieldnames=fieldnames)
                writer.writeheader()

                # Iterate through CoinMarketCap data and add token classification
                for row in rows:
                    columns = row.find_all('td')
                    if len(columns) > 10:  # Ensure we have enough data
                        token_name = columns[2].find('p', class_='coin-item-symbol').text.strip() if columns[2] else 'N/A'
                        token_symbol = columns[2].find('span', class_='crypto-symbol').text.strip() if columns[2] else 'N/A'
                        price = columns[3].find('span').text.strip() if columns[3] else 'N/A'
                        market_cap = columns[6].text.strip() if columns[6] else 'N/A'
                        circulating_supply = columns[5].text.strip() if columns[5] else 'N/A'
                        volume_24h = columns[7].text.strip() if columns[7] else 'N/A'
                        percent_change_1h = columns[8].text.strip() if columns[8] else 'N/A'
                        percent_change_24h = columns[9].text.strip() if columns[9] else 'N/A'
                        percent_change_7d = columns[10].text.strip() if columns[10] else 'N/A'

                        # Add Token Classification (from predefined classification)
                        blockchain_network = "Ethereum"  # This can be dynamically assigned based on URL or other criteria
                        token_class = next(
                            (item for item in token_classification.get(blockchain_network, []) if item['Token Symbol'] == token_symbol),
                            None
                        )

                        if token_class:
                            contract_address = token_class['Contract Address']
                            verified_contract = token_class['Verified Contract']
                            scam_indicator = token_class['Scam Indicator']
                            notes = token_class['Notes']
                        else:
                            contract_address = 'N/A'
                            verified_contract = 'N/A'
                            scam_indicator = 'N/A'
                            notes = 'N/A'

                        # Prepare the data for the current row
                        row_data = {
                            'Blockchain Network': blockchain_network,
                            'Token Name': token_name,
                            'Token Symbol': token_symbol,
                            'Contract Address': contract_address,
                            'Verified Contract': verified_contract,
                            'Scam Indicator': scam_indicator,
                            'Notes': notes,
                            'Price': price,
                            'Market Cap': market_cap,
                            'Circulating Supply': circulating_supply,
                            'Volume (24h)': volume_24h,
                            '% Change (1h)': percent_change_1h,
                            '% Change (24h)': percent_change_24h,
                            '% Change (7d)': percent_change_7d
                        }

                        writer.writerow(row_data)

            # Print message indicating data is saved
            print(rf"Data saved to G:\app\Cloud-Driven Blockchain Integrity and Optimization Model (CDBIOM)\main Dataset")
            print(f"Time Elapsed: {datetime.datetime.now() - start}")
            break
        elif response.status_code == 404:
            print("Page not found.")
            break
        else:
            print("Retrying...")  # Retry if page is not accessible
            continue

def main():
    url = "https://coinmarketcap.com/all/views/all/"  # URL for CoinMarketCap's all cryptocurrencies page
    extract(url)

if __name__ == '__main__':
    main()
