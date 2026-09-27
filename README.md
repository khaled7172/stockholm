*This Project was created by khhammou*

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

## Tests
First we build the image and create the infection folder
Then you create some fake files and run make run to encrypt them
copy the key you got to decrypt later
Verify using ls ~/infection the file extensions
then reverse the encryption and verify file extension returned to original form
verify silent mode works
verify unsupported extensions dont get encrypted
verify already encrypted files are skipped
Try to decrypyt with a fake key and fail

```
make build
mkdir -p ~/infection
echo "hello" > ~/infection/test.txt
echo "hello" > ~/infection/test.docx
make run
ls ~/infection
make reverse
ls ~/infection
echo "hello" > ~/infection/test.txt
make silent
ls ~/infection/
echo "ignore me" > ~/infection/ignore.xyz
echo "encrypt me" > ~/infection/doc.docx
make run
ls ~/infection/
```

## How it works
The program targets files inside `~/infection` whose extensions match those
affected by the WannaCry ransomware. It encrypts them using Fernet (AES-128-CBC
with HMAC-SHA256) and appends a `.ft` extension. The key is printed at runtime
and must be saved to reverse the encryption.
