import tkinter as tk
import subprocess
import threading
import os

# Color settings
BACKGROUND_COLOR = "#00C9FF"  
TEXT_COLOR = "#000000"        
BUTTON_COLOR = "#3c3c3c"     
BUTTON_TEXT_COLOR = "#ffffff" 

def run_script(script_name):
    python_cmd = "python" if os.name == "nt" else "python3"

    # Start the process and capture output
    process = subprocess.Popen([python_cmd, script_name], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

    # Read stdout
    for line in process.stdout:
        root.after(0, update_output, line.strip(), "stdout")

    # Read stderr
    for err in process.stderr:
        root.after(0, update_output, f"ERROR: {err.strip()}", "stderr")

def update_output(text, tag):
    output_text.config(state=tk.NORMAL)
    output_text.insert(tk.END, text + "\n", tag)
    output_text.config(state=tk.DISABLED)
    output_text.see(tk.END)

def open_toolbox():
    threading.Thread(target=run_script, args=("toolbox.py",), daemon=True).start()

def open_essentials():
    threading.Thread(target=run_script, args=("essentials.py",), daemon=True).start()

# Main GUI window
root = tk.Tk()
root.title("ChristOurLife's Launcher")
root.geometry("600x400")
root.configure(bg=BACKGROUND_COLOR)  # Set background color

# Main Label
label = tk.Label(root, text="Welcome to ChristOurLife's Launcher! Choose a program to launch:",
                 font=("Arial", 14), bg=BACKGROUND_COLOR, fg=TEXT_COLOR)
label.pack(pady=20)

# Toolbox button
button_toolbox = tk.Button(root, text="Toolbox", command=open_toolbox,
                           bg=BUTTON_COLOR, fg=BUTTON_TEXT_COLOR, activebackground="#555555", activeforeground="#ffffff")
button_toolbox.pack(pady=20)

# Essentials button
button_essentials = tk.Button(root, text="Essentials", command=open_essentials,
                              bg=BUTTON_COLOR, fg=BUTTON_TEXT_COLOR, activebackground="#555555", activeforeground="#ffffff")
button_essentials.pack(pady=5)

# Output Text widget
output_text = tk.Text(root, height=10, width=70, state=tk.DISABLED, bg="#2e2e2e", fg=TEXT_COLOR, insertbackground=TEXT_COLOR)
output_text.pack(pady=20)

# Define color tags for output text
output_text.tag_config("stdout", foreground="lightgreen")
output_text.tag_config("stderr", foreground="red")

# Keep application open
root.mainloop()
