import Route from '@ember/routing/route';
import { service } from '@ember/service';

export default class ShowRoute extends Route {
  @service store;

  model(movie) {
    return this.store.findRecord('movie', movie.movie_id);
  }
}
