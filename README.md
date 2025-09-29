# 📊 Data Collection Techniques  

This branch covers different techniques for collecting data, with a strong focus on **web scraping** using Python.  

📂 **Branch Link**  
[Data-Collection-Techniques branch on GitHub](https://github.com/Tarun-pandit/Data_Science_practice/tree/Data-Collection-Techniques)

## 📚 Topics Covered  
1. **Data Collection Techniques – Overview**  
   - Introduction to data collection  
   - Why data collection is important in Data Science & AI  
   - Different sources of data (APIs, Databases, Web Scraping, Open Datasets)  

2. **Introduction to Web Scraping**  
   - What is web scraping?  
   - Use cases and applications  
   - Legal and ethical considerations in scraping  

3. **HTML for Web Scraping**  
   - Basics of HTML structure  
   - Understanding tags, attributes, and DOM  
   - Identifying the right elements for scraping  

4. **Using `requests` Module for Data Collection**  
   - Sending HTTP requests with Python  
   - Handling responses and status codes  
   - Extracting raw HTML content  

5. **Using Beautiful Soup for Data Collection**  
   - Parsing HTML with Beautiful Soup  
   - Navigating and searching the DOM  
   - Extracting text, attributes, and structured data  

## 🛠️ Tools & Libraries Used  
- **Python 3**  
- [`requests`](https://docs.python-requests.org/) – for making HTTP requests  
- [`BeautifulSoup`](https://www.crummy.com/software/BeautifulSoup/) – for parsing HTML  

## 🚀 How to Use  
1. Clone the repository:  
   ```bash
   git clone https://github.com/Tarun-pandit/Data_Science_practice.git
Navigate to this branch:
git checkout Data-Collection-Techniques

Install dependencies:
pip install requests beautifulsoup4

Run the scripts and follow along with the lessons.

🖥️ Demo Code Snippet  
Here’s a simple example of using requests and BeautifulSoup to scrape titles from a sample website:

import requests
from bs4 import BeautifulSoup

# URL to scrape
url = "https://quotes.toscrape.com/"

# Send GET request
response = requests.get(url)

# Parse HTML content
soup = BeautifulSoup(response.text, "html.parser")

# Extract all quote texts
quotes = soup.find_all("span", class_="text")

print("Quotes from the website:\n")
for i, quote in enumerate(quotes[:5], 1):  # Print first 5 quotes
    print(f"{i}. {quote.text}")
