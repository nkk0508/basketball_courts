import React from 'react';
import PropTypes from 'prop-types';
import { makeStyles, useTheme } from '@material-ui/core/styles';
import Input from '@material-ui/core/Input';
import InputLabel from '@material-ui/core/InputLabel';
import MenuItem from '@material-ui/core/MenuItem';
import FormControl from '@material-ui/core/FormControl';
import ListItemText from '@material-ui/core/ListItemText';
import Select from '@material-ui/core/Select';
import Checkbox from '@material-ui/core/Checkbox';
import Chip from '@material-ui/core/Chip';
import axios from 'axios';

let currentServerUrl;

const propTypes = {
  updateWeeksUrl: PropTypes.func.isRequired,
  updateAddressUrl: PropTypes.func.isRequired,
  updateCategoriesUrl: PropTypes.func.isRequired,
  weeksUrl: PropTypes.array.isRequired,
  addressUrl: PropTypes.array.isRequired,
  categoriesUrl: PropTypes.array.isRequired,
};

const useStyles = makeStyles(theme => ({
  formControl: {
    margin: theme.spacing(1),
    minWidth: 120,
    maxWidth: 300,
  },
  chips: {
    display: 'flex',
    flexWrap: 'wrap',
  },
  chip: {
    margin: 2,
  },
}));

const ITEM_HEIGHT = 48;
const ITEM_PADDING_TOP = 8;
const MenuProps = {
  PaperProps: {
    style: {
      maxHeight: ITEM_HEIGHT * 4.5 + ITEM_PADDING_TOP,
      width: 250,
    },
  },
};

function getStyles(filterTitle, filtering, theme) {
  return {
    fontWeight:
    filtering.indexOf(filterTitle) === -1
        ? theme.typography.fontWeightRegular
        : theme.typography.fontWeightMedium,
  };
}

export default function SearchMultipleSelect(props) {
  const filterID = props.filterID;
  const filterItems = props.filterItems;
  const classes = useStyles();
  const theme = useTheme();
  const [filtering, setFiltering] = React.useState([]);

  const handleChange = event => {
    let selectedValues = event.target.value;
    let nil = 'nil';

    if (filterID === 'weeks') {
      if (selectedValues.length > 0) {
        updateCurrentServerUrl(selectedValues, props.addressUrl, props.categoriesUrl);
        props.updateWeeksUrl(selectedValues);
      }　else {
        nil = 'nil';
        updateCurrentServerUrl(nil, props.addressUrl, props.categoriesUrl);
        props.updateWeeksUrl(['nil']);
      };
    }

    if (filterID === 'address') {
      if (selectedValues.length > 0) {
        updateCurrentServerUrl(props.weeksUrl, selectedValues, props.categoriesUrl);
        props.updateAddressUrl(selectedValues);
      }　else {
        nil = 'nil';
        updateCurrentServerUrl(props.weeksUrl, nil, props.categoriesUrl);
        props.updateAddressUrl(['nil']);
      };
    }

    if (filterID === 'categories') {
      if (selectedValues.length > 0) {
        updateCurrentServerUrl(props.weeksUrl, props.addressUrl, selectedValues);
        props.updateCategoriesUrl(selectedValues);
      }　else {
        nil = 'nil';
        updateCurrentServerUrl(props.weeksUrl, props.addressUrl, nil);
        props.updateCategoriesUrl(['nil']);
      };
    }

    $('.card-court').removeClass('d-none');

    axios.get(currentServerUrl).then((res) => {
        let displayIDs = res.data;
        displayIDs.forEach(function(ID){
          $(`.card-court-id-${ID}`).addClass('d-none');
        });
    }).catch(console.error);

    setFiltering(selectedValues);
  };

  const updateCurrentServerUrl = (weeks, address, categories) => {
    currentServerUrl = `https://basketmania.info/search/${weeks}/${address}/${categories}`;
  }

  return (
    <div>
      <FormControl className={classes.formControl}>
        <InputLabel id="multiple-chip-label">{props.filterTitle}</InputLabel>
        <Select
          labelId="multiple-chip-label"
          id="multiple-chip"
          multiple
          value={filtering}
          onChange={handleChange}
          input={<Input id="select-multiple-chip" />}
          renderValue={selected => (
            <div className={classes.chips}>
              {selected.map(value => (
                <Chip key={value} label={value} className={classes.chip} />
              ))}
            </div>
          )}
          MenuProps={MenuProps}
        >
          {filterItems.map(filterTitle => (
            <MenuItem key={filterTitle} value={filterTitle} style={getStyles(filterTitle, filtering, theme)}>
              <Checkbox checked={filtering.indexOf(filterTitle) > -1} />
              <ListItemText primary={filterTitle} />
            </MenuItem>
          ))}
        </Select>
      </FormControl>
    </div>
  );
}