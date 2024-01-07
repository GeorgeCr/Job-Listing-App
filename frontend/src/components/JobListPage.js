import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import './JobListPage.css';
import Navbar from './Navbar';

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

const JobListPage = () => {

  const [searchQuery, setSearchQuery] = useState('');
  const [filteredJobs, setFilteredJobs] = useState(jobList);
  const [currentPage, setCurrentPage] = useState(1);
  const [jobsPerPage] = useState(3);

  // Search Bar Code
  const handleSearch = (e) => {
    const query = e.target.value.toLowerCase();
    setSearchQuery(query);

    const filtered = jobList.filter(
      (job) =>
        job.title.toLowerCase().includes(query) ||
        job.description.toLowerCase().includes(query)
    );

    setFilteredJobs(filtered);
  };

  // Pagination Code
  const paginate = (pageNumber) => {
    setCurrentPage(pageNumber);
  };

  // Qualification Code Template
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

  const indexOfLastJob = currentPage * jobsPerPage;
  const indexOfFirstJob = indexOfLastJob - jobsPerPage;
  const currentJobs = filteredJobs.slice(indexOfFirstJob, indexOfLastJob);

  return (
    <div>
      <Navbar />
      {/* Search Bar */}
      <div className="search-bar">
      <input
          type="text"
          placeholder="Search..."
          value={searchQuery}
          onChange={handleSearch}
        />
      </div>
      <div className="page-content">
        <div className="title">
          <h3>Available Jobs</h3>
        </div>
        <div className="job-list">
        {currentJobs.map((job) => (
          <div key={job.id} className="job-box">
              <img src={job.logo} alt="Job Logo" />
              <div className="job-details">
                {/* Link to the JobSpecsPage */}
                <Link to={`/jobs/${job.id}`}>
                  <h3>{job.title}</h3>
                </Link>
                <p>{job.description}</p>
              </div>
              <div className="qualification-icon">
                {getQualificationIcon(job.qualificationStatus)}
              </div>
            </div>
          ))}
        </div>
        <div className="pagination">
        {Array.from({ length: Math.ceil(filteredJobs.length / jobsPerPage) }).map(
          (item, index) => (
            <span key={index} onClick={() => paginate(index + 1)}>
              {index + 1}
            </span>
          )
        )}
      </div>
      </div>
    </div>
  );
};

export default JobListPage;