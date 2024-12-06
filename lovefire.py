import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

# Function to generate heart shape
def heart_shape(t):
    x = 16 * np.sin(t)**3
    y = 13 * np.cos(t) - 5 * np.cos(2 * t) - 2 * np.cos(3 * t) - np.cos(4 * t)
    return x, y

# Create the figure and axis
fig, ax = plt.subplots(figsize=(6, 6))
ax.axis('off')  # Turn off the axes
ax.set_xlim(-20, 20)
ax.set_ylim(-20, 20)

# Store fireworks data
fireworks = []

# Initialize animation with an empty scatter
scatter = ax.scatter([], [], s=[], c=[], alpha=0.6)

# Function to initialize the animation
def init():
    scatter.set_offsets([])
    scatter.set_sizes([])
    scatter.set_color([])
    return scatter,

# Function to animate the fireworks
def animate(frame):
    global fireworks
    
    if frame % 20 == 0:
        # Generate new firework
        t = np.linspace(0, 2 * np.pi, 100)
        x, y = heart_shape(t)
        x += np.random.uniform(-10, 10)  # Randomize position
        y += np.random.uniform(-10, 10)
        color = np.random.choice(['red', 'pink', 'magenta', 'orange'])
        fireworks.append((x, y, color))
    
    # Update fireworks
    sizes = []
    colors = []
    offsets = []
    for x, y, color in fireworks:
        x += np.random.uniform(-0.1, 0.1, len(x))  # Add jitter for sparkle
        y += np.random.uniform(-0.1, 0.1, len(y))
        offsets.extend(zip(x, y))
        sizes.extend([50] * len(x))
        colors.extend([color] * len(x))
    
    scatter.set_offsets(offsets)
    scatter.set_sizes(sizes)
    scatter.set_color(colors)
    return scatter,

# Create the animation
ani = FuncAnimation(fig, animate, frames=200, init_func=init, blit=True, interval=50)

# Display the animation
plt.show()
