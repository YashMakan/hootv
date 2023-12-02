import json
from io import BytesIO

import pycurl


class TmdbApi:
    def __init__(self, api_key):
        self.api_key = api_key
        self.base_url = 'https://api.themoviedb.org/3'

    def request(self, path, method='GET', params=None, data=None):
        # Construct the full URL
        url = f"{self.base_url}/{path}"
        if method == 'GET' and params:
            url += '?' + '&'.join([f"{key}={params[key]}" for key in params])

        # Create a BytesIO object to store the response
        buffer = BytesIO()

        # Create a pycurl.Curl object
        curl = pycurl.Curl()

        # Set the URL and parameters
        curl.setopt(curl.URL, url)
        curl.setopt(curl.WRITEDATA, buffer)

        # Set up for POST request if applicable
        if method == 'POST' and data:
            curl.setopt(curl.POST, 1)
            curl.setopt(curl.POSTFIELDS, data)

        # Perform the request
        curl.perform()

        # Get the HTTP status code
        status_code = curl.getinfo(pycurl.HTTP_CODE)

        # Check if the request was successful (status code 200)
        if status_code == 200:
            # Parse and return the response
            response_text = buffer.getvalue().decode('utf-8')
            return json.loads(response_text)
        else:
            # Print an error message if the request was not successful
            print(f"Error: {status_code}")

        # Clean up
        curl.close()
