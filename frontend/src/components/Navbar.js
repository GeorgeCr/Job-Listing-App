import React, { useContext } from 'react';
import { Link } from 'react-router-dom';

const Navbar = () => {
  return (
    <div className="navbar">
      <div className="left">
        <Link to="/">JobList</Link>
      </div>
      <div className="center">
        <Link to="/jobs">Jobs</Link>
        <Link to="/profile">Profile</Link>
      </div>
      <div className="right">
        <button>Login</button>
        <button>Register</button>
      </div>
    </div>
  );
};

export default Navbar;