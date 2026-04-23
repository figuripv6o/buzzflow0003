import { useState } from "react";

export default function App() {
  const [message, setMessage] = useState("");

  const drop = () => {
    navigator.geolocation.getCurrentPosition((pos) => {
      console.log("DROP:", {
        message,
        lat: pos.coords.latitude,
        lng: pos.coords.longitude
      });
      alert("Drop sent 🔥");
    });
  };

  return (
    <div style={{ padding: 20 }}>
      <h1>🐝 FYNDR</h1>

      <input
        placeholder="Drop a vibe..."
        onChange={(e) => setMessage(e.target.value)}
      />

      <button onClick={drop}>
        Drop Signal 📍
      </button>
    </div>
  );
}
