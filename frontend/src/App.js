// import "./App.css";
// import { useEffect, useState } from "react";

// function App() {
//   const [val, setVal] = useState([]);

//   useEffect(() => {
//     fetch("http://localhost:8080/test", {
//       method: "GET",
//     })
//       .then((res) => res.json())
//       .then((data) => setVal(data.secrets));
//   }, []);

//   return <div>Hello, server says: {val.map(({ content }) => content)}</div>;
// }

// export default App;
import "./App.css";
import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Navbar from './components/Navbar';
import JobListPage from './components/JobListPage';
import JobSpecsPage from './components/JobSpecsPage';
import ProfilePage from './components/ProfilePage';

const App = () => {
  return (
    <Router>
      <div>
        <Navbar />
        <Switch>
          <Route path="/jobs" component={JobListPage} />
          <Route path="/jobs/:id" component={JobSpecsPage} />
          <Route path="/profile" component={ProfilePage} />
        </Switch>
      </div>
    </Router>
  );
};

export default App;