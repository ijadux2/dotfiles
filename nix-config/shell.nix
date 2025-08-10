{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    git          # Version control system
    nodejs      # JavaScript runtime
    python3     # Python 3
    python3Packages.requests  # Example Python package 
    micro          # Text editor
    gcc          # C/C++ compiler 
    jdk        # Build automation tool
  ];

  shellHook = ''
    echo "Welcome to the development shell!"
    echo "You can use the following tools:"
    echo "- Git"
    echo "- Node.js"
    echo "- Python 3"
    echo "- Docker"
    echo "- Vim"
    echo "- GCC"
    echo "- Make"
  '';
}
