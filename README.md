# Stockholm

A harmless ransomware simulation for educational purposes — 42 Cybersecurity Piscine.

## Requirements
- Python 3
- `cryptography` library: `pip3 install cryptography`

## Usage
```bash
# Encrypt files in ~/infection
python3 stockholm

# Decrypt files using the key printed during encryption
python3 stockholm --reverse <KEY>

# Run silently (no output)
python3 stockholm --silent

# Show version
python3 stockholm --version

# Show help
python3 stockholm --help
```

## How it works
The program targets files inside `~/infection` whose extensions match those
affected by the WannaCry ransomware. It encrypts them using Fernet (AES-128-CBC
with HMAC-SHA256) and appends a `.ft` extension. The key is printed at runtime
and must be saved to reverse the encryption.
