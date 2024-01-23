import React, { useContext, useEffect, useState } from "react";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Paper from "@mui/material/Paper";
import RemoveCircleIcon from "@mui/icons-material/RemoveCircle";
import { ErrorContext } from "../../context";
import { useNavigate } from "react-router-dom";
import { Button } from "@mui/material";

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
          setError({
            message: "Failed to load job applications.",
            status: response.status,
          });
          throw new Error("Failed to fetch user jobs data.");
        }
      } catch (err) {
        console.error(err);
      }
    };

    fetchUserAppliedJobs();
  }, []);

  const handleRemoveApplication = async (event, jobId) => {
    event.stopPropagation();
    const jobsAfterRemoval = userAppliedJobs.filter(({ id }) => id !== jobId);
    setUserAppliedJobs(jobsAfterRemoval);

    try {
      setError({});
      const response = await fetch(
        `http://localhost:8080/user/jobs/${jobId}/apply`,
        {
          method: "DELETE",
          credentials: "include",
          headers: {
            "Content-Type": "application/json",
          },
        }
      );

      if (response.ok) {
        console.log("success");
      } else {
        setError({
          message: "Failed to delete job. ",
          status: response.status,
        });
        throw new Error("Failed to delete job");
      }
    } catch (err) {
      console.error(err);
    }
  };

  return (
    <TableContainer component={Paper}>
      <Table sx={{ minWidth: 650 }} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>Title</TableCell>
            <TableCell>Company</TableCell>
            <TableCell>Location</TableCell>
            <TableCell>Applicants</TableCell>
            <TableCell>Remove your Application</TableCell>
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
              <TableCell align="">
                <Button
                  sx={{
                    paddingLeft: "60px",
                  }}
                  color="error"
                  onClick={(event) => handleRemoveApplication(event, job.id)}
                >
                  <RemoveCircleIcon />
                </Button>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
}
