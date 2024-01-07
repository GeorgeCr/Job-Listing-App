import React from 'react';
import './JobSpecsPage.css';
import './Popup.css';
import Navbar from './Navbar';
import { useHistory, useParams } from 'react-router-dom';

const jobList = [
  {
    id: 1,
    title: 'Frontend Developer',
    description: 'Exciting opportunity for a skilled Frontend Developer...',
    logo: 'https://via.placeholder.com/50', // Placeholder image URL
  },
  {
    id: 2,
    title: 'Backend Developer',
    description: 'Join our team as a Backend Developer and contribute to...',
    logo: 'https://via.placeholder.com/50',
  },
  {
    id: 3,
    title: 'Full Stack Developer',
    description: 'Looking for a Full Stack Developer to work on a variety of...',
    logo: 'https://via.placeholder.com/50',
  },
];

const JobSpecsPage = () => {
  const { id } = useParams();
  const job = jobList.find((job) => job.id.toString() === id);

  const history = useHistory();

  const [isPopupVisible, setPopupVisibility] = useState(false);

  const handleApply = () => {
    // Display the popup when the button is clicked
    setPopupVisibility(true);

    setTimeout(() => {
      setPopupVisibility(false);
    }, 5000);
  };

  const getQualificationIcon = (qualificationStatus) => {
    switch (qualificationStatus) {
      case 'fullyQualified':
        return '✅';
      case 'partiallyQualified':
        return '⚠️';
      case 'notQualified':
        return '❌';
      default:
        return '';
    }
  };

  const requirements = [
    {
      title: 'Bachelor’s Degree in Computer Science or related field',
      qualificationStatus: 'fullyQualified',
    },
    {
      title: '2+ years of experience in frontend development',
      qualificationStatus: 'partiallyQualified',
    },
    {
      title: 'Strong knowledge of JavaScript and React',
      qualificationStatus: 'fullyQualified',
    },
  ];

  return (
    <div>
      <Navbar />
      <div className="company-details">
        <img src={job.logo} alt="Company Logo" />
        <div className="job-details">
          <h1>{job.title}</h1>
          <p>{job.description}</p>
        </div>
      </div>
      <div className="job-content">
        <div className="job-requirements">
          <h2>Job Requirements</h2>
          <ul>
            {requirements.map((requirement, index) => (
              <li key={index}>
                {getQualificationIcon(requirement.qualificationStatus)}{' '}
                {requirement.title}
              </li>
            ))}
          </ul>
        </div>
        <div className="apply-button">
          <button onClick={handleApply}>Apply</button>
          {isPopupVisible && (
            <div className="popup">
              Application sent successfully!
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default JobSpecsPage;