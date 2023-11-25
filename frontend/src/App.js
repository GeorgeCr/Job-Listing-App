import "./App.css";
import { useEffect, useState } from "react";

function App() {
  const [val, setVal] = useState([]);

  useEffect(() => {
    fetch("http://localhost:8080/test", {
      method: "GET",
    })
      .then((res) => res.json())
      .then((data) => setVal(data.secrets));
  }, []);

  return <div>Hello, server says: {val.map(({ content }) => content)}</div>;
}

export default App;
