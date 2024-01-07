import React from 'react';
import Navbar from './Navbar';
import './ProfilePage.css';

const ProfileManagementPage = () => {
  // Hardcoded user data
  const user = {
    name: 'John Doe',
    email: 'john@example.com',
    phone: '123-456-7890',
    qualifications: [
        'Bachelor of Science in Computer Science',
        'Certified Full Stack Web Developer',
        'Project Management Professional (PMP)',
      ],
  };

  return (
<div>
      <Navbar />
      <div className="profile-page">
        <div className="left-half">
          <div className="profile-section">
            <h2>Profile Management</h2>
            <div className="profile-info">
              <div className="info-item">
                <p>Name:</p>
                <input type="text" value={user.name} readOnly />
                <button className="change-button">Change</button>
              </div>
              <div className="info-item">
                <p>Email:</p>
                <input type="text" value={user.email} readOnly />
                <button className="change-button">Change</button>
              </div>
              <div className="info-item">
                <p>Phone:</p>
                <input type="text" value={user.phone} readOnly />
                <button className="change-button">Change</button>
              </div>
            </div>
          </div>
          <div className="qualifications-section">
            <h2>Qualifications</h2>
            <div className="qualification-buttons">
              <button className="add-button">Add</button>
              <button className="remove-button">Remove</button>
            </div>
            <div className="qualification-list">
              <ul>
                {user.qualifications.map((qualification, index) => (
                  <li key={index}>{qualification}</li>
                ))}
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ProfilePage;