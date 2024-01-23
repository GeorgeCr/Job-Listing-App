import React from "react";

const Jobs = ({ jobs }) => {
  return (
    <ul>
      Jobs here
      {jobs.map((job) => (
        <li>{JSON.stringify(job)}</li>
      ))}
    </ul>
  );
};

export default Jobs;
