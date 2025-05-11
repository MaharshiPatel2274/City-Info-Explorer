# 🌍 City Info Explorer – Web Services and JSON Processing in SwiftUI

Developed as part of **CSE 335 - Lab 8** at the School of Computing and Augmented Intelligence, this iOS application allows users to explore nearby cities based on a geographic bounding box using the GeoNames.org API. The app demonstrates REST API calls, JSON decoding, and SwiftUI list/map integration.

🔗 Visit my portfolio: [maharshi-patel.com](https://maharshi-patel.com)

## 📱 Overview

This SwiftUI-based iOS app pulls live data from the GeoNames API and:

- Displays a list of nearby cities with name, country, and population
- Shows the selected city on a map view
- Limits results to the **first 10 entries** from the web service

## 🌐 Web Service Used

- **API Endpoint:** `http://api.geonames.org/citiesJSON`
- **Service Type:** REST
- **Required Parameters:**  
  - `north`, `south`, `east`, `west`: Bounding box coordinates  
  - `username`: Your GeoNames account username  
  - `maxRows`: Defaults to 10  
- **Response Format:** JSON with filtered, relevant city data

📌 Example Call:
```
http://api.geonames.org/citiesJSON?north=44.1&south=-9.9&east=22.4&west=55.2&lang=en&username=your_username
```

> ⚠️ Note: You must create a free GeoNames account and replace `username=demo` with your actual username to ensure stable responses.

## 🧱 Architecture & Features

- **MVVM** Design Pattern
- **JSON Decoding** using `Codable`
- **Web Service Integration** using `URLSession`
- **UI Features**:
  - Table View with City Name, Country, and Population
  - Map View on selection showing city location
  - Clean and responsive SwiftUI design

## 📦 Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/MaharshiPatel2274/City-Info-Explorer
   ```

2. Replace the `username` in the API call with your GeoNames account username in the appropriate ViewModel or Networking file.

3. Open the project in **Xcode** (iOS 15+ recommended), build, and run.

## 📁 Project Structure

```
City-Info-Explorer/
├── Models/
│   └── City.swift
├── ViewModels/
│   └── CityViewModel.swift
├── Views/
│   ├── CityListView.swift
│   ├── CityDetailView.swift
│   └── MapView.swift
└── Utilities/
    └── NetworkService.swift
```


**Author:** Maharshi Niraj Patel  
[Portfolio](https://maharshi-patel.com) • [GitHub](https://github.com/MaharshiPatel2274)
