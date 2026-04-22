import express from "express";
import cors from "cors";

const app = express();
app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.json({ status: "🐝 Buzz API LIVE" });
});

app.get("/health", (req, res) => {
  res.json({ ok: true, port: 5000 });
});

app.listen(5000, "0.0.0.0", () => {
  console.log("🚀 API running on http://127.0.0.1:5000");
});
