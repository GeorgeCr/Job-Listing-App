import React, { useContext, useEffect, useState } from "react";
import { ErrorContext } from "../../context";
import { Button, IconButton, Skeleton } from "@mui/material";
import RefreshIcon from "@mui/icons-material/Refresh";
import SearchInput from "../../components/SearchInput";
import { DataGrid } from "@mui/x-data-grid";
import { Link } from "react-router-dom";

const columns = [
  { field: "title", headerName: "Title", width: 180 },
  { field: "description", headerName: "Description", width: 130 },
  { field: "collaborationType", headerName: "Collaboration Type", width: 180 },
  {
    field: "salary",
    headerName: "Gross Salary",
    width: 130,
  },
  {
    field: "company",
    headerName: "Company",
    width: 130,
    valueGetter: (params) => params.row.company?.name || "N/A",
  },
  {
    field: "applicantsCount",
    headerName: "Applicants",
    type: "number",
    width: 90,
  },
  {
    field: "",
    align: "right",
    flex: 1,
    type: "actions",
    sortable: false,
    renderCell: (params) => {
      console.log("paramsss", params);
      return (
        <Button
          onClick={(e) => {
            e.stopPropagation();
          }}
          style={{ textTransform: "none" }}
          variant="contained"
          component={Link}
          to={`/job/${params.row.id}`}
        >
          View
        </Button>
      );
    },
  },
];

export default function Jobs() {
  const [jobs, setJobs] = useState([]);
  const [shouldLoadJobs, setShouldLoadJobs] = useState(true);
  const { setError } = useContext(ErrorContext);
  const [isLoading, setIsLoading] = useState(false);
  const [searchTerm, setSearchTerm] = useState("");
  const [searchedJobs, setSearchedJobs] = useState([]);
  console.log("jobs", jobs);
  console.log("is loading", isLoading);
  console.log("should reload", shouldLoadJobs);
  useEffect(() => {
    const fetchAllJobs = async () => {
      try {
        setIsLoading(true);
        const response = await fetch("http://localhost:8080/job", {
          method: "GET",
          credentials: "include",
          headers: {
            "Content-Type": "application/json",
          },
        });
        if (response.ok) {
          setError({});
          const data = await response.json();
          setJobs(data.jobs);
          setSearchedJobs(data.jobs);
        } else {
          const errMessage = await response.text();
          setError({ message: "Failed to fetch jobs. ", status: response.status });
          throw new Error(`Something went wrong. ${errMessage}`);
        }
      } catch (err) {
        console.error(err);
        setJobs([]);
      } finally {
        setIsLoading(false);
      }
    };
    if (shouldLoadJobs) {
      setShouldLoadJobs(false);
      fetchAllJobs();
    }
  }, [shouldLoadJobs]);

  const handleSearch = () => {
    const filteredJobs = jobs.filter((job) =>
      job.title.toLowerCase().includes(searchTerm.toLowerCase())
    );
    setSearchedJobs(filteredJobs);
  };

  return (
    <>
      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          paddingBottom: "16px",
        }}
      >
        <div style={{ flex: 1 }}>
          <SearchInput
            search={handleSearch}
            handleChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
        <IconButton
          style={{ width: "50px" }}
          onClick={() => setShouldLoadJobs(true)}
          color="primary"
          aria-label="add to shopping cart"
        >
          <RefreshIcon />
        </IconButton>
      </div>

      {isLoading ? (
        <>
          <Skeleton animation="wave" />
          <Skeleton animation="wave" />
          <Skeleton animation="wave" />
          <Skeleton animation="wave" />
          <Skeleton animation="wave" />
        </>
      ) : (
        <DataGrid
          rows={searchedJobs}
          columns={columns}
          initialState={{
            pagination: {
              paginationModel: { page: 0, pageSize: 10 },
            },
          }}
          pageSizeOptions={[5, 10]}
          checkboxSelection
        />
      )}
    </>
  );
}
