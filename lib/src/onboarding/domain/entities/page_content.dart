import 'package:equatable/equatable.dart';
import 'package:exam_app/core/resources/media_res.dart';

class PageContent extends Equatable{

  const PageContent({
    required this.img,
    required this.title,
    required this.desc,}
      );

  const PageContent.first() : this(
      img: MediaRes.casualReading,
    title: 'Brand new curriculum',
    desc: "This is the first online education platform 'From Ijlal'",
  );

  const PageContent.second() : this(
    img: MediaRes.casuallife,
    title: 'Brand new curriculum',
    desc: "This is the first online education platform 'From Ijlal'",
  );

  const PageContent.third() : this(
    img: MediaRes.casualMeditation,
    title: 'Brand new curriculum',
    desc: "This is the first online education platform 'From Ijlal'",
  );

  final String img;
  final String title;
  final String desc;

  @override
  List<Object?> get props => [img, title, desc];

}
