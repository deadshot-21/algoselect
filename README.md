![Algoselect Logo](https://github.com/deadshot-21/algoselect/blob/main/assets/images/logo.png)

Algoselect is a mobile application designed to simplify the selection process of cryptographic schemes based on individual user requirements. This README file provides an overview of the project, its design, implementation, and instructions on building the APK.

---

## Project Design

### Cryptographic Primitive Selection
The core focus of Algoselect revolves around the selection of "Private Key Encryption Algorithms." These algorithms are listed and compared based on various properties such as security, runtime efficiency, ease of implementation, use cases, flexibility, scalability, key size, block length (bits), and probable attacks. This information is organized in a tabular format within the "Implementation Usage" table, where each row represents a different block cipher algorithm (e.g., AES, DES, Blowfish), and each cell contains the respective algorithm's properties.

### Question/Answer Interface
The application employs a question/answer interface that engages users by presenting a series of tailored questions. The decision tree algorithm dynamically generates subsequent questions based on the user's previous responses. This adaptive approach ensures the relevance of questions, extracting essential information about the user's requirements and constraints regarding cryptographic schemes.

### Algorithm Selection
Upon receiving user inputs, the algorithm traverses the "Implementation Usage" table, evaluating the provided answers. It identifies and recommends the most suitable cryptographic scheme that aligns with the user's needs. The chosen scheme is then displayed, accompanied by comprehensive details and instructions for its implementation.

---

## Building the APK
To build the APK for Algoselect, follow these steps:
1. Clone the repository: `git clone https://github.com/yourusername/algoselect.git`
2. Navigate to the project directory: `cd algoselect`
3. Install dependencies: `npm install` or `yarn install`
4. Build the APK: `npm run build-apk` or `yarn build-apk`

**Please Note:** The API is hosted on a free server, which may result in an initial loading time of 2-3 minutes for the first request. Subsequent requests should perform faster once the initial loading is complete.

---

## Disclaimer
Algoselect is a project aimed at enhancing accessibility to cryptographic schemes for non-experts. However, it's important to note that while the application provides recommendations based on user inputs, it does not guarantee absolute security. Users should conduct further research and seek expert advice when implementing cryptographic solutions in sensitive environments.

Thank you for your interest in Algoselect! We hope this application serves as a valuable tool for simplifying the process of selecting cryptographic schemes.
