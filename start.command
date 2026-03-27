#!/bin/bash
cd "$(dirname "$0")"
echo ""
echo "  Echolalia is running at http://localhost:8000"
echo "  Press Ctrl+C to stop."
echo ""
open "http://localhost:8000"
python3 -m http.server 8000
