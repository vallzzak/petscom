import tkinter as tk
import webbrowser
from pynput import keyboard
import threading
import string

# Function to open the URL
def open_url(qr_data):
    url = f"http://211.221.158.198:3000/Front.html?memberCode={qr_data}"
    webbrowser.open(url)

# Listener class to handle global key events
class QRCodeListener:
    def __init__(self):
        self.qr_data = ""

    def on_press(self, key):
        try:
            # Convert key to a readable string
            char = key.char
            if char and char in string.printable:
                self.qr_data += char
        except AttributeError:
            # Handle special keys (e.g., Enter key)
            if key == keyboard.Key.enter:
                # Remove non-printable characters
                self.qr_data = ''.join(filter(lambda x: x in string.printable, self.qr_data))
                open_url(self.qr_data)
                self.qr_data = ""
    
    def start(self):
        # Start the global listener in a separate thread
        listener = keyboard.Listener(on_press=self.on_press)
        listener.start()

# Function to exit the application
def exit_app():
    root.destroy()

# Create the main application window
root = tk.Tk()
root.title("QR Code Scanner")
root.geometry("150x50")  # Smaller window size

# Add an Exit button
exit_button = tk.Button(root, text="Exit", command=exit_app)
exit_button.pack(pady=10)

# Start the QR code listener
qr_listener = QRCodeListener()
listener_thread = threading.Thread(target=qr_listener.start)
listener_thread.daemon = True
listener_thread.start()

# Start the main event loop
root.mainloop()
