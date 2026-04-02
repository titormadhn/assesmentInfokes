# assesmentInfokes
Repository Online Assesment Test PT Infokes Indonesia

## 1. Setup Awal & Dependencies

Untuk menjalankan automation website menggunakan Robot Framework, lakukan langkah berikut:

1. **Install Python** (rekomendasi versi 3.8+)
2. **Install Robot Framework**
	```bash
	pip install robotframework
	```
3. **Install SeleniumLibrary**
	```bash
	pip install robotframework-seleniumlibrary
	```
4. **Install WebDriver**
	- Untuk Chrome: [Download ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/downloads) dan pastikan path-nya sudah di-setup di environment variable.

## 2. Struktur Folder (Modularity & POM Model)

```
exampleAutomation/
├── stepDefinition/         # Resource file per halaman (POM)
│   └── sdLogin.resource   # Keyword untuk halaman login
├── testCase/              # Test case utama
│   └── Login.robot        # Test case login
├── utility/               # Resource utilitas/global
│   └── variable.resource  # Variabel global
```

- **Modularity:** Setiap fungsi/halaman dipisah dalam resource file berbeda.
- **POM Model:** Keyword di setiap resource hanya untuk 1 halaman (misal: login).
- **Test case** hanya memanggil keyword dari resource, tidak langsung selector.

## 3. Best Practice yang Sudah Diterapkan

- Terdapat penerapan **waiting berbasis kondisi** (misal: `Wait Until Element Is Visible`).
- Terdapat penerapan **assertion yang jelas** (misal: `Element Should Be Visible`, `Element Should Contain`).
- Struktur file dan keyword **maintainable** dan mudah dikembangkan dengan dipakainya struktur Modularity & POM Model