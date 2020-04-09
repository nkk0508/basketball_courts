import React from "react"
import FormGroup from '@material-ui/core/FormGroup';
import SearchMultipleSelect from "./search_multiple_select";

const filterWeeks = ['月', '火', '水', '木', '金', '土', '日'];
const filterAddress = ['千代田区', '中央区', '港区', '新宿区', '文京区', '台東区', '墨田区', '江東区', '品川区', '目黒区', '大田区', '世田谷区', '渋谷区', '中野区', '杉並区', '豊島区', '北区', '荒川区', '板橋区', '練馬区', '足立区', '葛飾区', '江戸川区'];
const filterCategories = ['公共体育館', '屋外コート']

class SearchForm extends React.Component {

  constructor(props) {
    super(props);
    this.updateWeeksUrl = this.updateWeeksUrl.bind(this);
    this.updateAddressUrl = this.updateAddressUrl.bind(this);
    this.updateCategoriesUrl = this.updateCategoriesUrl.bind(this);
    this.state = {
      weeksUrl: ['nil'],
      addressUrl: ['nil'],
      categoriesUrl: ['nil']
    };
  }

  updateWeeksUrl(weeksUrl) {
    this.setState({weeksUrl: weeksUrl});
  };

  updateAddressUrl(addressUrl) {
    this.setState({addressUrl: addressUrl});
  };

  updateCategoriesUrl(categoriesUrl) {
    this.setState({categoriesUrl: categoriesUrl});
  };

  render () {
    return (
      <React.Fragment>
        <div className='search'>
          <div className='search-title'>検索条件を指定</div>
          <FormGroup row>
            <SearchMultipleSelect filterID={'weeks'} filterTitle={'曜日'} filterItems={filterWeeks}　weeksUrl={this.state.weeksUrl} addressUrl={this.state.addressUrl} categoriesUrl={this.state.categoriesUrl} updateWeeksUrl={this.updateWeeksUrl}/>
            <SearchMultipleSelect filterID={'address'} filterTitle={'地域'} filterItems={filterAddress} weeksUrl={this.state.weeksUrl} addressUrl={this.state.addressUrl} categoriesUrl={this.state.categoriesUrl} updateAddressUrl={this.updateAddressUrl}/>
            <SearchMultipleSelect filterID={'categories'} filterTitle={'カテゴリ'} filterItems={filterCategories} weeksUrl={this.state.weeksUrl} addressUrl={this.state.addressUrl} categoriesUrl={this.state.categoriesUrl} updateCategoriesUrl={this.updateCategoriesUrl}/>
          </FormGroup>
        </div>
      </React.Fragment>
    );
  }
}

export default SearchForm
