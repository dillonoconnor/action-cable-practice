import consumer from "./consumer"

document.addEventListener("turbolinks:load", () => {
  if (document.querySelector("#room-id")) {
    const roomHeader = document.getElementById("room-id");
    const roomData = roomHeader.getAttribute("data-room-id");
    
    consumer.subscriptions.create({channel: "RoomChannel", room_id: roomData}, {
      connected() {
        console.log(`Connected to room channel ${roomData}.`);
      },
    
      disconnected() {
      },
    
      received(data) {
        
      }
    });
  }
});


