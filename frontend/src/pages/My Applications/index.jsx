import React, { useContext, useEffect, useState } from "react";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Paper from "@mui/material/Paper";
import { ErrorContext } from "../../context";
import { useNavigate } from "react-router-dom";

export default function MyApplications() {
  const { setError } = useContext(ErrorContext);
  const [userAppliedJobs, setUserAppliedJobs] = useState([]);
  const navigateTo = useNavigate();
  console.log(userAppliedJobs, "user applied");

  useEffect(() => {
    const fetchUserAppliedJobs = async () => {
      try {
        const response = await fetch("http://localhost:8080/user/jobs", {
          method: "GET",
          credentials: "include",
          headers: {
            "Content-Type": "application/json",
          },
        });

        if (response.ok) {
          const data = await response.json();
          setUserAppliedJobs(data.jobs);
        } else {
          throw new Error("Failed to fetch user jobs data.");
        }
      } catch (err) {
        console.error(err);
        setError({ message: err });
      }
    };

    fetchUserAppliedJobs();
  }, []);

  return (
    <TableContainer component={Paper}>
      <Table sx={{ minWidth: 650 }} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>Title</TableCell>
            <TableCell>Company</TableCell>
            <TableCell>Location</TableCell>
            <TableCell>Applicants</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
            {/* add button to remove your application */}
          {userAppliedJobs.map((job) => (
            <TableRow
              hover={true}
              key={job.id}
              sx={{
                "&:last-child td, &:last-child th": { border: 0 },
                cursor: "pointer",
              }}
              onClick={() => navigateTo(`/job/${job.id}`)}
            >
              <TableCell component="th" scope="row">
                {job.title}
              </TableCell>
              <TableCell>{job.company?.name || ""}</TableCell>
              <TableCell>{job.company?.location || ""}</TableCell>
              <TableCell>{job.applicantsCount}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
}
