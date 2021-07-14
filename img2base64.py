import sys
import base64

with open(sys.argv[1], 'rb') as f: # rb for read binary
    print(base64.b64encode(f.read()).decode('ascii'))
    
