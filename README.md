# The ENCRYPTOR

## About
The ENCRYPTOR is a cross-platform mobile application developed using Flutter and Android Studio, implementing Advanced Encryption Standard (AES) for secure data handling. This app allows users to generate and scan encrypted QR codes, ensuring that the information contained within can only be accessed by the intended recipients.

## Why Flutter and Android Studio?
- **Cross-Platform Efficiency:** Flutter allows for the development of both iOS and Android apps from a single codebase, streamlining the development process and ensuring consistency across platforms.
- **Rich Set of Widgets:** Flutter provides a comprehensive collection of pre-designed widgets that help in creating a visually appealing and responsive user interface.
- **Performance:** Flutter's high-performance app engine is designed to work closely with the underlying hardware, providing a smooth and fast user experience that's close to native app performance.
- **Developer Productivity:** Android Studio, when combined with Flutter, provides a powerful environment with features like Hot Reload, which significantly speeds up the development cycle by instantly reflecting code changes in the app.

## Why AES Encryption?
- **Security:** AES is a widely recognized encryption standard used globally, including by the U.S. government, for securing sensitive data.
- **Performance:** AES offers a good balance between security and performance, encrypting data quickly without compromising on safety.
- **Scalability:** AES encryption is scalable, providing different levels of security based on key sizes (128, 192, and 256 bits) to meet various security needs.

## App Components
1. **Generate QR Code:**
    - Users can input text, which is then encrypted using AES encryption before generating a QR code. This ensures that the information within the QR code remains confidential and secure.

2. **AES Encryption:**
    - The app securely encrypts the text using AES, providing a layer of protection against unauthorized access. This encrypted text is what is encoded into the QR code.

3. **Scan QR:**
    - Upon scanning an encrypted QR code, the app decrypts the content back into the original text. This functionality allows only users with the correct decryption key to access the information.



