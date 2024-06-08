import tkinter as tk
from tkinter import filedialog
import subprocess
import os

def split_large_file(input_file, volume_size_mb=2000):
    # Get the original file name
    original_filename = os.path.basename(input_file)

    # Get the directory of the input file
    input_directory = os.path.dirname(input_file)

    # Run the 7-Zip command to split the file
    subprocess.run(['7z', 'a', f'-v{volume_size_mb}m','-m0=Copy', f'{input_directory}/{original_filename}.7z', input_file])

    print(f"File '{original_filename}' split successfully")

def select_file_and_split():
    file_path = filedialog.askopenfilename(title='Select a file')
    if file_path:
        split_large_file(file_path)

if __name__ == '__main__':
    root = tk.Tk()
    root.withdraw()  # Hide the main window

    select_file_and_split()
