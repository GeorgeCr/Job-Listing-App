import { useContext, useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { ErrorContext } from "../../context";
import { Box, Button, Chip, CssBaseline } from "@mui/material";

import * as React from "react";
import { styled } from "@mui/material/styles";
import Card from "@mui/material/Card";
import CardHeader from "@mui/material/CardHeader";
import CardMedia from "@mui/material/CardMedia";
import CardContent from "@mui/material/CardContent";
import CardActions from "@mui/material/CardActions";
import Collapse from "@mui/material/Collapse";
import Avatar from "@mui/material/Avatar";
import IconButton from "@mui/material/IconButton";
import Typography from "@mui/material/Typography";
import { red } from "@mui/material/colors";
import FavoriteIcon from "@mui/icons-material/Favorite";
import ShareIcon from "@mui/icons-material/Share";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import MoreVertIcon from "@mui/icons-material/MoreVert";
import WorkIcon from "@mui/icons-material/Work";
import PlaceIcon from "@mui/icons-material/Place";
import BusinessIcon from "@mui/icons-material/Business";
import WarningIcon from "@mui/icons-material/Warning";

const ExpandMore = styled((props) => {
  const { expand, ...other } = props;
  return <IconButton {...other} />;
})(({ theme, expand }) => ({
  transform: !expand ? "rotate(0deg)" : "rotate(180deg)",
  marginLeft: "auto",
  transition: theme.transitions.create("transform", {
    duration: theme.transitions.duration.shortest,
  }),
}));

const ViewJob = () => {
  const [jobData, setJobData] = useState({});
  console.log("job data", jobData);
  const [jobSkills, setJobSkills] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const params = useParams();
  const { setError } = useContext(ErrorContext);
  const [expanded, setExpanded] = useState(false);
  const [hasApplied, setHasApplied] = useState(false);

  const handleExpandClick = () => {
    setExpanded(!expanded);
  };

  useEffect(() => {
    const fetchJobData = async () => {
      try {
        setIsLoading(true);
        const response = await fetch(`http://localhost:8080/job/${params.id}`, {
          method: "GET",
          credentials: "include",
          headers: {
            "Content-Type": "application/json",
          },
        });
        console.log("respp", response);
        if (response.ok) {
          setError({});
          const data = await response.json();
          if (data.hasUserAlreadyApplied) {
            setHasApplied(true);
          }
          console.log("data", data);
          setJobData(data);
        } else {
          const errMessage = await response.text();
          throw new Error(`Something went wrong. ${errMessage}`);
        }
      } catch (err) {
        console.error(err);
        setError({ message: "Failed to fetch job data." });
      } finally {
        setIsLoading(false);
      }
    };

    const fetchJobSkills = async () => {
      try {
        const response = await fetch(
          `http://localhost:8080/job/${params.id}/skills`,
          {
            method: "GET",
            credentials: "include",
            headers: {
              "Content-Type": "application/json",
            },
          }
        );
        if (response.ok) {
          setError({});
          const data = await response.json();
          console.log("data", data);
          setJobSkills(data);
        } else {
          const errMessage = await response.text();
          throw new Error(`Something went wrong. ${errMessage}`);
        }
      } catch (err) {
        console.error(err);
        setError({ message: "Failed to fetch job skills data." });
      }
    };

    fetchJobData();
    fetchJobSkills();
  }, []);

  const handleJobApply = async () => {
    console.log("job data dude", jobData);
    const jobId = jobData.id;
    try {
      const response = await fetch(
        `http://localhost:8080/user/jobs/${jobId}/apply`,
        {
          method: "POST",
          credentials: "include",
          headers: {
            "Content-Type": "application/json",
          },
        }
      );

      if (response.ok) {
        console.log("applied boi");
        setHasApplied(true);
      } else {
        throw new Error("Failed to apply");
      }
    } catch (err) {
      console.error(err);
      setError({ message: err });
    }
  };

  return (
    <Box sx={{ display: "flex", width: "100%" }}>
      <CssBaseline />
      <Card sx={{ width: "75%" }}>
        <CardHeader
          avatar={
            <Avatar sx={{ bgcolor: red[500] }} aria-label="recipe">
              R
            </Avatar>
          }
          action={
            <IconButton aria-label="settings">
              <MoreVertIcon />
            </IconButton>
          }
          title={`${jobData.title || ""} Job`}
          subheader="September 14, 2016"
        />
        <PlaceIcon />
        <BusinessIcon />
        <CardMedia
          component="img"
          height="500"
          image="https://images.unsplash.com/photo-1635350736475-c8cef4b21906?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
          alt="Paella dish"
        />
        <CardContent>
          <Typography variant="body2" color="text.secondary">
            Required skills for this job:{" "}
            {jobSkills.map((skill) => {
              const isSkillsMismatched = jobData.jobSkillsMismatches?.find(
                (mismatchSkill) => skill.id === mismatchSkill.id
              );
              return (
                <Chip
                  icon={
                    isSkillsMismatched && (
                      <WarningIcon fontSize="small" color="warning" />
                    )
                  }
                  style={{ marginRight: "10px" }}
                  label={`${skill.seniority} ${skill.name}`}
                />
              );
            })}
          </Typography>
        </CardContent>
        <CardActions disableSpacing>
          <Button
            style={{ textTransform: "none" }}
            variant="contained"
            startIcon={<WorkIcon />}
            onClick={handleJobApply}
            disabled={hasApplied}
          >
            {hasApplied ? "Applied" : "Apply now!"}
          </Button>
          <ExpandMore
            expand={expanded}
            onClick={handleExpandClick}
            aria-expanded={expanded}
            aria-label="show more"
          >
            <ExpandMoreIcon />
          </ExpandMore>
        </CardActions>
        <Collapse in={expanded} timeout="auto" unmountOnExit>
          <CardContent>
            <Typography paragraph>Job Description:</Typography>
            <Typography paragraph>{jobData.description}</Typography>
          </CardContent>
        </Collapse>
      </Card>
      {/* jobbbb{JSON.stringify(jobData)} */}
    </Box>
  );
};

export default ViewJob;
