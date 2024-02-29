import 'package:uni/controller/fetchers/schedule_fetcher/schedule_fetcher.dart';
import 'package:uni/controller/networking/network_router.dart';
import 'package:uni/controller/parsers/parser_schedule.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:uni/model/entities/profile.dart';
import 'package:uni/model/entities/session.dart';
import 'package:uni/model/utils/week_response.dart';

/// Class for fetching the user's lectures from the faculties' API.
class ScheduleFetcherApi extends ScheduleFetcher {
  @override
  List<String> getEndpoints(Session session) {
    final urls = NetworkRouter.getBaseUrlsFromSession(session)
        .map((url) => '${url}mob_hor_geral.estudante')
        .toList();
    return urls;
  }

  /// Fetches the user's lectures from the faculties' API.
  @override
  Future<List<Lecture>> getLectures(Session session, Profile profile) async {
    final dates = getDates();

    final urls = getEndpoints(session);
    final responses = <WeekResponse>[];
    for (final url in urls) {
      final futures = dates.map(
        (date) => NetworkRouter.getWithCookies(
          url,
          {
            'pv_codigo': session.username,
            'pv_semana_ini': date.asSigarraWeekStart,
            'pv_semana_fim': date.asSigarraWeekEnd,
          },
          session,
        ).then((response) => WeekResponse(date.week, response)),
      );

      responses.addAll(await Future.wait(futures));
    }

    return parseScheduleMultipleRequests(responses);
  }
}
