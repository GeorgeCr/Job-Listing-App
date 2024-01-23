import "./App.css";
import { useEffect, useState } from "react";
import Dashboard, { Copyright } from "./pages/JobDashboard/Dashboard";
import { Route, Routes, Navigate, useNavigate } from "react-router-dom";
import SignUp from "./pages/SignUp";
import SignInSide from "./pages/SignIn";
import {
  Alert,
  AlertTitle,
  Badge,
  Button,
  Container,
  CssBaseline,
  Divider,
  Grid,
  IconButton,
  List,
  ThemeProvider,
  Toolbar,
  Typography,
  createTheme,
} from "@mui/material";
import MuiDrawer from "@mui/material/Drawer";
import Box from "@mui/material/Box";
import MuiAppBar from "@mui/material/AppBar";
import MenuIcon from "@mui/icons-material/Menu";
import { ErrorContext } from "./context";
import ViewJob from "./pages/ViewJob";
import ChevronLeftIcon from "@mui/icons-material/ChevronLeft";
import NotificationsIcon from "@mui/icons-material/Notifications";
import LoginIcon from "@mui/icons-material/Login";
import {
  mainListItems,
  secondaryListItems,
} from "./pages/JobDashboard/listItems";
import styled from "@emotion/styled";
import MyApplications from "./pages/My Applications";
import PersonIcon from "@mui/icons-material/Person";
import MyProfile from "./pages/MyProfile";
import NewJob from "./pages/NewJob";

const drawerWidth = 240;

const AppBar = styled(MuiAppBar, {
  shouldForwardProp: (prop) => prop !== "open",
})(({ theme, open }) => ({
  zIndex: theme.zIndex.drawer + 1,
  transition: theme.transitions.create(["width", "margin"], {
    easing: theme.transitions.easing.sharp,
    duration: theme.transitions.duration.leavingScreen,
  }),
  ...(open && {
    marginLeft: drawerWidth,
    width: `calc(100% - ${drawerWidth}px)`,
    transition: theme.transitions.create(["width", "margin"], {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.enteringScreen,
    }),
  }),
}));

const Drawer = styled(MuiDrawer, {
  shouldForwardProp: (prop) => prop !== "open",
})(({ theme, open }) => ({
  "& .MuiDrawer-paper": {
    position: "relative",
    whiteSpace: "nowrap",
    width: 240,
    transition: theme.transitions.create("width", {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.enteringScreen,
    }),
    boxSizing: "border-box",
    ...(!open && {
      overflowX: "hidden",
      transition: theme.transitions.create("width", {
        easing: theme.transitions.easing.sharp,
        duration: theme.transitions.duration.leavingScreen,
      }),
      width: theme.spacing(7),
      [theme.breakpoints.up("sm")]: {
        width: theme.spacing(9),
      },
    }),
  },
}));

const defaultTheme = createTheme();

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [error, setError] = useState({});
  const [open, setOpen] = useState(true);
  const navigateTo = useNavigate();
  const toggleDrawer = () => {
    setOpen(!open);
  };

  useEffect(() => {
    setError(false);
  }, []);

  console.log("error stuff", error);

  return (
    // <div>
    <ThemeProvider theme={defaultTheme}>
      <Box sx={{ display: "flex " }}>
        <CssBaseline />
        <ErrorContext.Provider value={{ error, setError }}>
          <AppBar position="absolute" open={open}>
            <Toolbar
              sx={{
                pr: "24px", // keep right padding when drawer closed
              }}
            >
              <IconButton
                edge="start"
                color="inherit"
                aria-label="open drawer"
                onClick={toggleDrawer}
                sx={{
                  marginRight: "36px",
                  ...(open && { display: "none" }),
                }}
              >
                <MenuIcon />
              </IconButton>
              <Typography
                component="h1"
                variant="h6"
                color="inherit"
                noWrap
                sx={{ flexGrow: 1 }}
              >
                Job Listing LLC
              </Typography>
              <IconButton color="inherit">
                <Badge badgeContent={4} color="secondary">
                  <NotificationsIcon />
                </Badge>
              </IconButton>
            </Toolbar>
          </AppBar>
          <Drawer variant="permanent" open={open}>
            <Toolbar
              sx={{
                display: "flex",
                alignItems: "center",
                justifyContent: "flex-end",
                px: [1],
              }}
            >
              <IconButton onClick={toggleDrawer}>
                <ChevronLeftIcon />
              </IconButton>
            </Toolbar>
            <Divider />
            <List component="nav">
              {mainListItems}
              <Divider sx={{ my: 1 }} />
              {secondaryListItems}
            </List>
          </Drawer>
          <Box sx={{ display: "flex", width: "100%" }}>
            <CssBaseline />
            <Box
              component="main"
              sx={{
                backgroundColor: (theme) =>
                  theme.palette.mode === "light"
                    ? theme.palette.grey[100]
                    : theme.palette.grey[900],
                flexGrow: 1,
                height: "100vh",
                overflow: "auto",
              }}
            >
              <Toolbar />
              <Container className="salkf" maxWidth="lg" sx={{ mt: 4, mb: 4 }}>
                <Grid container spacing={3}>
                  <Grid item xs={12}>
                    <Routes>
                      <Route path="/" element={<Navigate to="/dashboard" />} />
                      <Route path="/dashboard" element={<Dashboard />} />
                      <Route path="/sign-up" element={<SignUp />} />
                      <Route path="/sign-in" element={<SignInSide />} />
                      <Route path="/job/:id" element={<ViewJob />} />
                      <Route
                        path="/my-applications"
                        element={<MyApplications />}
                      />
                      <Route path="/my-profile" element={<MyProfile />} />
                      <Route path="/job/new" element={<NewJob />} />
                    </Routes>
                  </Grid>
                </Grid>
                <Copyright sx={{ pt: 4 }} />
              </Container>
            </Box>
          </Box>
        </ErrorContext.Provider>
        {error.message && (
          <div className="global-alert">
            <Alert onClose={() => setError({})} severity="error">
              <AlertTitle>
                Error. {error.message}{" "}
                {error.status === 401 && (
                  <>
                    {"Session expired. Please login."}
                    <Button onClick={() => navigateTo("/sign-in")}>
                      <LoginIcon />
                    </Button>
                  </>
                )}
              </AlertTitle>
            </Alert>
          </div>
        )}
      </Box>
    </ThemeProvider>
    // </div>
  );
}

export default App;

// export default App;
// import "./App.css";
// import React from 'react';
// import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
// import Navbar from './components/Navbar';
// import JobListPage from './components/JobListPage';
// import JobSpecsPage from './components/JobSpecsPage';
// import ProfilePage from './components/ProfilePage';

// const App = () => {
//   return (
//     <Router>
//       <div>
//         <Navbar />
//         <Switch>
//           <Route path="/jobs" component={JobListPage} />
//           <Route path="/jobs/:id" component={JobSpecsPage} />
//           <Route path="/profile" component={ProfilePage} />
//         </Switch>
//       </div>
//     </Router>
//   );
// };

// export default App;
