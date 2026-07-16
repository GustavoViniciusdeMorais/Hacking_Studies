# Diffie-Hellman
```bash
# Public values
p=29
g=3

# Private keys
a=13
b=15

# Calculate public keys
A=$(( (g**a) % p ))
B=$(( (g**b) % p ))
echo "Alice's public key: $A"
echo "Bob's public key: $B"

# Calculate shared secret
shared_alice=$(( (B**a) % p ))
shared_bob=$(( (A**b) % p ))
echo "Shared secret (Alice): $shared_alice"
echo "Shared secret (Bob): $shared_bob"
```
