package br.fmu.bioreino.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

import br.fmu.bioreino.R;

public class CoursesViewAdapter extends RecyclerView.Adapter<CoursesViewAdapter.Holder> {

    ArrayList<String> data;
    private final Context context;

    public CoursesViewAdapter(ArrayList<String> data, Context context){
        this.data = data;
        this.context = context;
    }

    @NonNull
    @Override
    public Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(context).inflate(
                R.layout.item_lesson_card,
                parent,
                false
        );
        return new Holder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull Holder holder, int position) {
        holder.cardHeader.setText(data.get(position));
    }

    @Override
    public int getItemCount() {
        return data.size();
    }



    public class Holder extends RecyclerView.ViewHolder {

        TextView cardHeader;


        public Holder(@NonNull View itemView) {
            super(itemView);
            cardHeader = itemView.findViewById(R.id.item_lesson_card_header);
        }
    }

}
