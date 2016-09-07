import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

socket.connect()

let channel = socket.channel("html:main", {})
channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })


function role(roleName) {
  return $(`[data-role='${roleName}']`);
}

channel.on("prepend", payload => {
  if(payload.removeRole) {
    role(payload.removeRole).hide();
  }

  if(payload.removeClass) {
    $(`.${payload.removeClass}`).removeClass(payload.removeClass);
  }

  const prependElement = role(payload.roleName);
  prependElement.prepend(payload.html);
})

export default socket
