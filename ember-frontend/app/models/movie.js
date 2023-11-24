import Model, { attr } from "@ember-data/model";

export default class MovieModel extends Model {
  @attr('string') title;
  @attr('string') release_date;
  @attr('string') runtime;
  @attr('string') genre;
  @attr('string') parental_rating;
  @attr('string') plot;
  @attr('string') rating;
  @attr('string') created_at;
  @attr('string') updated_at;
}
