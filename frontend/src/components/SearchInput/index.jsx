import {
  Box,
  FormControl,
  Input,
  InputAdornment,
  InputLabel,
} from "@mui/material";
import SearchIcon from "@mui/icons-material/Search";
import "./index.css";

const SearchInput = ({ handleChange, search }) => {
  return (
    <Box width={"100%"} sx={{ "& > :not(style)": { m: 1 } }}>
      <FormControl variant="standard">
        <InputLabel htmlFor="input-with-icon-adornment">
          Find your next opportunity
        </InputLabel>
        <Input
          onChange={handleChange}
          onKeyUp={(e) => {
            if (e.key === "Enter") {
              search();
            }
          }}
          id="input-with-icon-adornment"
          startAdornment={
            <InputAdornment
              style={{ cursor: "pointer" }}
              onClick={search}
              position="start"
            >
              <SearchIcon />
            </InputAdornment>
          }
        />
      </FormControl>
    </Box>
  );
};

export default SearchInput;
