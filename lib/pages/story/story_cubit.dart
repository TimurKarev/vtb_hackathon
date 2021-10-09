import 'package:bloc/bloc.dart';
import 'package:vtb_hackathon/pages/story/models/story_page_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoryCubit extends Cubit<StoryPageModel> {
  StoryCubit(this.storyId) : super(StoryPageModel.empty()) {
    _loadFirst();
  }

  String storyId;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _loadFirst() async {
    StoryPageModel page = await firestore
        .collection('stories')
        .doc(storyId)
        .get()
        .then(
            (value) => StoryPageModel.fromMap(value.data()!, value.reference));

    emit(page);
  }
}
