// Listen for messages from Lua
window.addEventListener('message', function(event) {
    if (event.data.action === 'open') {
        document.getElementById('report-ui').classList.remove('hidden');
    } else if (event.data.action === 'close') {
        document.getElementById('report-ui').classList.add('hidden'); // Hide the UI when instructed to close
    }
});

// Event listener for the submit button
document.getElementById('submitReport').addEventListener('click', function() {
    const reportType = document.getElementById('reportType').value;
    const playerName = document.getElementById('playerName').value;
    const reason = document.getElementById('reason').value;
    const reportContent = document.getElementById('reportContent').value;

    fetch(`https://${GetParentResourceName()}/submitReport`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ type: reportType, player: playerName, reason: reason, content: reportContent })
    }).then(() => {
        document.getElementById('reportContent').value = '';  // Clear the description
        document.getElementById('playerName').value = '';     // Clear the player's name
        document.getElementById('reason').value = '';         // Clear the reason
        alert('Report submitted!');  // Notify the user of successful submission

        
    });
});

// Event listener for the close button
document.getElementById('closeReport').addEventListener('click', function() {
    fetch(`https://${GetParentResourceName()}/close`, {
        method: 'POST'
    }).then(() => {
        // This will be handled by the NUI callback to close the UI
    });
});

// Event listener for the close button
document.getElementById('closeReport').addEventListener('click', function() {
    fetch(`https://${GetParentResourceName()}/close`, {
        method: 'POST'
    });
});