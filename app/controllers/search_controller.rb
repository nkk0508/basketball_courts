class SearchController < ApplicationController
  def show
    replace_hash = {
      '月' => 'monday',
      '火' => 'tuesday',
      '水' => 'wednesday',
      '木' => 'thursday',
      '金' => 'friday',
      '土' => 'saturday',
      '日' => 'sunday'
    }
    weeks = params[:weeks]
    address = params[:address]
    categories = params[:categories]
    should_merge = false

    courts = Court.none

    courts = Court.all if weeks != 'nil' || address != 'nil' || categories != 'nil'

    if weeks != 'nil'
      weeks.gsub!(/月|火|水|木|金|土|日/, replace_hash)
      array_weeks = weeks.split(',')
      array_weeks.each do |week|
        courts = courts.where("#{week} =  \'\'")
      end
      should_merge = true
    end

    if address != 'nil'
      array_address = address.split(',')
      address_filtered_courts = Court.all.ransack(address_not_cont_any: array_address).result
      if should_merge
        courts = courts.or(address_filtered_courts)
      else
        courts = courts.ransack(address_not_cont_any: array_address).result
        logger.debug(courts.pluck(:id))
      end
      should_merge = true
    end

    if categories != 'nil'
      array_categories = categories.split(',')
      categories_filtered_courts = Court.all.ransack(categories_not_in: array_categories).result
      if should_merge
        courts = courts.or(categories_filtered_courts)
        logger.debug(courts.pluck(:id))
      else
        courts = courts.ransack(categories_not_in: array_categories).result
      end
    end

    render :json => courts.pluck(:id)
  end
end
