import React, { useContext, useEffect, useState } from "react";
import {
  Card,
  CardContent,
  Typography,
  Grid,
  Avatar,
  CardHeader,
  Chip,
} from "@mui/material";
import { ErrorContext } from "../../context";
import { red } from "@mui/material/colors";

const MyProfile = () => {
  const [userData, setUserData] = useState({});
  const { setError } = useContext(ErrorContext);

  const {
    role,
    username,
    firstName,
    lastName,
    hobbies,
    lastEducation,
    collaborationType,
  } = userData || {};

  useEffect(() => {
    const fetchUserData = async () => {
      try {
        const response = await fetch("http://localhost:8080/user/data", {
          method: "GET",
          credentials: "include",
          headers: {
            "Content-Type": "application/json",
          },
        });

        if (response.ok) {
          const data = await response.json();
          setUserData(data);
        }
      } catch (err) {
        console.error(err);
        setError({ message: err });
      }
    };
    fetchUserData();
  }, []);

  return (
    <Card sx={{width: "110%"}}>
      <CardContent>
        <Typography variant="h5" gutterBottom>
          <CardHeader
            avatar={
              <Avatar sx={{ bgcolor: red[500] }} aria-label="recipe">
                {firstName?.[0]}
                {lastName?.[0]}
              </Avatar>
            }
            title={`${firstName || "N/A"} ${lastName || ""}'s Profile`}
          />
        </Typography>
        <CardContent>
          <Grid container spacing={2}>
            <Grid item xs={6}>
              <Typography variant="body1">Role: {role}</Typography>
              <Typography variant="body1">Username: {username}</Typography>
              <Typography variant="body1">Hobbies: {hobbies}</Typography>
            </Grid>
            <Grid item xs={6}>
              <Typography variant="body1">
                Last Education: {lastEducation}
              </Typography>
              <Typography variant="body1">
                Collaboration Type: {collaborationType}
              </Typography>
              <Typography variant="body1">
                Skills:{" "}
                {userData.skills?.map((skill) => (
                  <Chip
                    style={{ marginRight: "10px" }}
                    label={`${skill.seniority} ${skill.name}`}
                  />
                ))}
              </Typography>
            </Grid>
          </Grid>
        </CardContent>
      </CardContent>
    </Card>
  );
};

export default MyProfile;
