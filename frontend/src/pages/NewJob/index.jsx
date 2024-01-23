import React, { useContext, useEffect, useState } from "react";
import {
  TextField,
  TextareaAutosize,
  Button,
  Grid,
  Paper,
  Typography,
  FormControl,
  InputLabel,
  Select,
  MenuItem,
} from "@mui/material";
import { ErrorContext } from "../../context";

const NewJob = () => {
  const { setError } = useContext(ErrorContext);
  const [formData, setFormData] = useState({
    title: "",
    description: "",
    company: {
      name: "",
      location: "",
    },
    benefits: "",
    skills: "",
    salary: 0,
    collaborationType: "",
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prevData) => ({
      ...prevData,
      [name]: value,
    }));
  };

  useEffect(() => {
    setError(false);
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();
    // Add logic to handle form submission
    console.log("Form submitted:", formData);
    const parsedSkills = formData.skills.split(", ");
    const senioritySkills = parsedSkills.map((skill) => {
      const returnedSkill = skill.split("=");
      return {
        name: returnedSkill[0],
        seniority: returnedSkill[1],
      };
    });
    console.log("senioriuty skills", senioritySkills);
    const parsedFormData = {
      ...formData,
      skills: senioritySkills,
      salary: parseInt(formData.salary),
      benefits: {
        description: formData.benefits,
      },
    };
    console.log(parsedFormData, "final form data");

    try {
      const response = await fetch("http://localhost:8080/job", {
        method: "POST",
        credentials: "include",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(parsedFormData),
      });
      if (response.ok) {
        console.log("created successfully");
        // set success banner
      } else {
        throw new Error("Failed to create job.");
      }
    } catch (err) {
      console.error(err);
      setError({ message: err });
    }
  };

  return (
    <Grid container justifyContent="center">
      <Grid item xs={8}>
        <Paper elevation={3} style={{ padding: "20px", marginTop: "20px" }}>
          <Typography variant="h5" gutterBottom>
            Create a New Job
          </Typography>
          <form onSubmit={handleSubmit}>
            <Grid container spacing={2}>
              <Grid item xs={12}>
                <TextField
                  label="Title"
                  variant="outlined"
                  fullWidth
                  name="title"
                  value={formData.title}
                  onChange={handleChange}
                />
              </Grid>
              <Grid item xs={12}>
                <TextareaAutosize
                  placeholder="Description"
                  minRows={3}
                  maxRows={10}
                  style={{ width: "100%" }}
                  name="description"
                  value={formData.description}
                  onChange={handleChange}
                />
              </Grid>
              <Grid item xs={6}>
                <TextField
                  label="Company"
                  variant="outlined"
                  fullWidth
                  name="company"
                  value={formData.company.name}
                  onChange={handleChange}
                />
              </Grid>
              <Grid item xs={6}>
                <TextField
                  label="Location"
                  variant="outlined"
                  fullWidth
                  name="location"
                  value={formData.company.location}
                  onChange={handleChange}
                />
              </Grid>
              <Grid item xs={6}>
                <TextField
                  label="Benefits"
                  variant="outlined"
                  fullWidth
                  name="benefits"
                  value={formData.benefits}
                  onChange={handleChange}
                />
              </Grid>
              <Grid item xs={6}>
                <TextField
                  label="Skills"
                  variant="outlined"
                  fullWidth
                  name="skills"
                  value={formData.skills}
                  onChange={handleChange}
                />
              </Grid>
              <Grid item xs={6}>
                <TextField
                  label="Salary"
                  type="number"
                  variant="outlined"
                  fullWidth
                  name="salary"
                  value={formData.salary}
                  onChange={handleChange}
                />
              </Grid>
              <Grid item xs={12}>
                <FormControl variant="outlined" fullWidth>
                  <InputLabel>Collaboration Type</InputLabel>
                  <Select
                    label="Collaboration Type"
                    name="collaborationType"
                    value={formData.collaborationType}
                    onChange={handleChange}
                  >
                    <MenuItem value="CIM">CIM</MenuItem>
                    <MenuItem value="B2B">B2B</MenuItem>
                  </Select>
                </FormControl>
              </Grid>
              <Grid item xs={12}>
                <Button type="submit" variant="contained" color="primary">
                  Create Job
                </Button>
              </Grid>
            </Grid>
          </form>
        </Paper>
      </Grid>
    </Grid>
  );
};

export default NewJob;
