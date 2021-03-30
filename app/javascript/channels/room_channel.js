import consumer from "./consumer"

document.addEventListener("turbolinks:load", () => {
  if (document.querySelector("#room-id")) {
    const roomHeader = document.getElementById("room-id");
    const roomData = roomHeader.getAttribute("data-room-id");
    const chatBox = document.getElementById("chat-box");
    const userId = Number(roomHeader.getAttribute("data-user-id"))
    
    consumer.subscriptions.create({channel: "RoomChannel", room_id: roomData}, {
      connected() {
        console.log(`Connected to room channel ${roomData}.`);
      },
    
      disconnected() {
      },
    
      received(data) {
        console.log(data);
        if (data.user_id === userId ) {
          chatBox.insertAdjacentHTML("beforeend", data.usermessage_html);
        } else {
          chatBox.insertAdjacentHTML("beforeend", data.othersender_html);
        }
      }
    });
  }
});


