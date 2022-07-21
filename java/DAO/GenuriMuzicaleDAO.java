package DAO;

import java.util.List;
import pojo.GenuriMuzicale;

public interface GenuriMuzicaleDAO {
    public void adaugaGenMuzical(GenuriMuzicale genmuzical);
    public List<GenuriMuzicale> afiseazaGenMuzical();
    public void modificaGenMuzical(long idgen, String nume, String data_aparitie, String tip);
    public void stergeGenMuzical(GenuriMuzicale genmuzical);
}